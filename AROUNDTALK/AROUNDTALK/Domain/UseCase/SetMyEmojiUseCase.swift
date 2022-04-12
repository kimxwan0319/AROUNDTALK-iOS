import Foundation

class SetMyEmojiUseCase {

    private let emojiRepository: EmojiRepository

    init(emojiRepository: EmojiRepository) {
        self.emojiRepository = emojiRepository
    }

    func excute(newEmoji: String) {
        self.emojiRepository.setMyEmoji(newEmoji: newEmoji)
    }

}
