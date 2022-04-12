import Foundation

import RxSwift

class FirebaseDataBaseDataSourceImpl: FirebaseDataBaseDataSource {

    private let firDatabaseProvidor: FIRDatabaseProvider<FIRDatabaseAPI>

    init(firDatabaseProvidor: FIRDatabaseProvider<FIRDatabaseAPI>) {
        self.firDatabaseProvidor = firDatabaseProvidor
    }

    func sendChat(chat: ChatEntity) async throws {
        try await firDatabaseProvidor.setValue(api: .saveChat(chat: chat))
    }

    func observeChat(locationName: String) -> AsyncThrowingStream<ChatEntity, Error> {
        firDatabaseProvidor.observe(api: .observeChat(locationName: locationName))
            .map { self.dictionaryToChatEntityArray(locationName: locationName, dictionary: $0) }
            .outspread()
    }

}

extension FirebaseDataBaseDataSourceImpl {
    func dictionaryToChatEntityArray(locationName: String, dictionary: NSDictionary) -> [ChatEntity] {
        dictionary.map {
            let chatInfoDic = $0.value as! NSDictionary
            return ChatEntity(
                code: $0.key as! String,
                emoji: chatInfoDic["emoji"] as! String,
                content: chatInfoDic["content"] as! String,
                locationName: locationName,
                latitude: chatInfoDic["latitude"] as! Double,
                longitude: chatInfoDic["longitude"] as! Double
            )
        }
    }
}
