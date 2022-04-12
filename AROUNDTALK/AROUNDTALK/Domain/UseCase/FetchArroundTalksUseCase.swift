import Foundation

class FetchArroundTalksUseCase {

    private let chatRepository: ChatRepository
    private let userLocationRepository: UserLocationRepository

    init(chatRepository: ChatRepository,
         userLocationRepository: UserLocationRepository) {
        self.chatRepository = chatRepository
        self.userLocationRepository = userLocationRepository
    }

    func execute() async -> AsyncThrowingStream<ChatEntity, Error> {
        let locationName = await userLocationRepository.reverseGeocodeNowLocation().thoroughfare!
        return chatRepository.observingChat(locationName: locationName)
            .map {
                var chat = $0
                chat.isMine = self.checkIsMyChat(chatCode: $0.code)
                return chat
            }
    }

}

extension FetchArroundTalksUseCase {
    func checkIsMyChat(chatCode: String) -> Bool {
        let myChatCodes = chatRepository.fetchMyChatCodes()
        return myChatCodes.contains(chatCode)
    }
}
