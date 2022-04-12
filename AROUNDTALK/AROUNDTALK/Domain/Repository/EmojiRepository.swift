import Foundation

protocol EmojiRepository {
    func fetchMyEmoji() -> String?
    func setMyEmoji(newEmoji: String)
}
