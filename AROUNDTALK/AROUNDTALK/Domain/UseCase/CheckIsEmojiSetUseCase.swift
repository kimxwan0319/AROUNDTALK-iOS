import Foundation

class CheckIsEmojiSetUseCase {

    private let emojiRepository: EmojiRepository

    init(emojiRepository: EmojiRepository) {
        self.emojiRepository = emojiRepository
    }

    func excute() -> Bool {
        self.emojiRepository.fetchMyEmoji() != nil
    }

}
