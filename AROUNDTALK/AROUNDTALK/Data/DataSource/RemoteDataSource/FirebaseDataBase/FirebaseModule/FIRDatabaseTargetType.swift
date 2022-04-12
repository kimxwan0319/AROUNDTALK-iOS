import Foundation

protocol FIRDatabaseTargetType {
    var childPath: String { get }
    var value: [String: Any]? { get }
}
