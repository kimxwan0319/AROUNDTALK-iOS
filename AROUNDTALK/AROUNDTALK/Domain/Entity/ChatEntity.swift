import Foundation

struct ChatEntity {
    var isMine: Bool = false
    let code: String
    var emoji: String
    let content: String
    let locationName: String
    let latitude: Double
    let longitude: Double
}
