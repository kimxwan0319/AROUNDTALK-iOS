import Foundation

protocol UserDefaultsDataSource {
    func fetchMyChatCodes() -> [String]
    func addMyChatCode(newChatCode: String)
    func fetchMyEmoji() -> String?
    func setMyEmoji(newEmoji: String)
}
