import Foundation

class FetchEmojiUseCase {

    private let emojiRepository: EmojiRepository

    init(emojiRepository: EmojiRepository) {
        self.emojiRepository = emojiRepository
    }

    func excute() -> String? {
        self.emojiRepository.fetchMyEmoji()
    }

}
