import Foundation

import FirebaseDatabase

class FIRDatabaseProvider<Target: FIRDatabaseTargetType> {

    private var databaseReference = Database.database().reference()

    func getData(api: Target) async throws -> NSDictionary {
        do {
            return try await databaseReference.child(api.childPath).getData().value as? NSDictionary ?? [:]
        } catch {
            throw FIRDatabaseError.noData
        }
        
    }

    func setValue(api: Target) async throws {
        do {
            try await databaseReference.child(api.childPath).setValue(api.value!)
        } catch {
            throw FIRDatabaseError.failedToSave
        }
    }

    func observe(api: Target) -> AsyncThrowingStream<NSDictionary, Error> {
        return .init() { continuation in
            self.databaseReference.child(api.childPath).observe(.value) { snapshot in
                if snapshot.exists() {
                    continuation.yield(snapshot.value! as? NSDictionary ?? [:])
                } else {
                    continuation.finish(throwing: FIRDatabaseError.noData)
                }
            }
        }
    }

}
