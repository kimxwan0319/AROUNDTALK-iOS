import Foundation

class ChatRepositoryImpl: ChatRepository {

    private let firebaseDataBaseDataSource: FirebaseDataBaseDataSource
    private let userDefaultsDataSource: UserDefaultsDataSource

    init(firebaseDataBaseDataSource: FirebaseDataBaseDataSource,
         userDefaultsDataSource: UserDefaultsDataSource) {
        self.firebaseDataBaseDataSource = firebaseDataBaseDataSource
        self.userDefaultsDataSource = userDefaultsDataSource
    }

    func sendChat(chat: ChatEntity) async throws {
        try await firebaseDataBaseDataSource.sendChat(chat: chat)
    }

    func observingChat(locationName: String) -> AsyncThrowingStream<ChatEntity, Error> {
        firebaseDataBaseDataSource.observeChat(locationName: locationName)
    }

    func fetchMyChatCodes() -> [String] {
        userDefaultsDataSource.fetchMyChatCodes()
    }

    func addMyChatCode(newChatCode: String) {
        userDefaultsDataSource.addMyChatCode(newChatCode: newChatCode)
    }

}
