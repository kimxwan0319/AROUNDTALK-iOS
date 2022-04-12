import Foundation

protocol ChatRepository {
    func sendChat(chat: ChatEntity) async throws
    func observingChat(locationName: String) -> AsyncThrowingStream<ChatEntity, Error>
    func fetchMyChatCodes() -> [String]
    func addMyChatCode(newChatCode: String)
}
