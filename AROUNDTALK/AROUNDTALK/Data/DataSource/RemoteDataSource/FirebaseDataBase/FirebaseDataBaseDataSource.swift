import Foundation

protocol FirebaseDataBaseDataSource {
    func sendChat(chat: ChatEntity) async throws
    func observeChat(locationName: String) -> AsyncThrowingStream<ChatEntity, Error>
}
