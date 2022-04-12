import Foundation

enum FIRDatabaseAPI {
    case saveChat(chat: ChatEntity)
    case observeChat(locationName: String)
}

extension FIRDatabaseAPI: FIRDatabaseTargetType {

    var childPath: String {
        switch self {
        case .saveChat(let chat):
            return "chat/\(chat.locationName)/\(chat.code)"
        case .observeChat(let locationName):
            return "chat/\(locationName)"
        }
    }
    
    var value: [String: Any]? {
        switch self {
        case .saveChat(let chat):
            return [
                "emoji": chat.emoji,
                "content": chat.content,
                "latitude": chat.latitude,
                "longitude": chat.longitude
            ]
        default:
            return nil
        }
    }

}







