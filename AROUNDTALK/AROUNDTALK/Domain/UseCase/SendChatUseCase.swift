import Foundation

class SendChatUseCase {

    private let chatRepository: ChatRepository
    private let userLocationRepository: UserLocationRepository
    private let emojiRepository: EmojiRepository

    init(chatRepository: ChatRepository,
         userLocationRepository: UserLocationRepository,
         emojiRepository: EmojiRepository) {
        self.chatRepository = chatRepository
        self.userLocationRepository = userLocationRepository
        self.emojiRepository = emojiRepository
    }

    func execute(content: String) async throws {
        let emoji = emojiRepository.fetchMyEmoji()!
        let chatCode = String.random(length: 6)
        let locationName = await userLocationRepository.reverseGeocodeNowLocation().thoroughfare!
        let coordinate = userLocationRepository.fetchMyLocation().coordinate
        chatRepository.addMyChatCode(newChatCode: chatCode)
        try await chatRepository.sendChat(chat: ChatEntity(
            isMine: true,
            code: chatCode,
            emoji: emoji,
            content: content,
            locationName: locationName,
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        ))
    }

}
