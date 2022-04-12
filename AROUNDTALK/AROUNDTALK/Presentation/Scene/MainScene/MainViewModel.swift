import Foundation

import MapKit

final class MainViewModel: NSObject, ObservableObject {

    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        latitudinalMeters: 100,
        longitudinalMeters: 100
    )
    @Published var chatText: String = .init()
    @Published var chatItems: [ChatAnnotationItem] = .init()

    private var fetchArroundTalksUseCase: FetchArroundTalksUseCase
    private var sendChatUseCase: SendChatUseCase


    init(fetchArroundTalksUseCase: FetchArroundTalksUseCase,
         sendChatUseCase: SendChatUseCase) {
        self.fetchArroundTalksUseCase = fetchArroundTalksUseCase
        self.sendChatUseCase = sendChatUseCase
    }

    func fetchArrondTalks() async throws {
        for try await arroundTalk in await fetchArroundTalksUseCase.execute() {
            self.insertChatItemWithDeduplication(ChatAnnotationItem(
                code: arroundTalk.code,
                isMine: arroundTalk.isMine,
                emoji: arroundTalk.emoji,
                content: arroundTalk.content,
                latitude: arroundTalk.latitude,
                longitude: arroundTalk.longitude
            ))
        }
    }

    func sendChat() async throws {
        try await sendChatUseCase.execute(content: self.chatText)
    }

}

extension MainViewModel {

    private func insertChatItemWithDeduplication(_ chatItem: ChatAnnotationItem) {
        var chatItemsAsSet = Set(self.chatItems)
        chatItemsAsSet.insert(chatItem)
        self.chatItems = Array(chatItemsAsSet)
    }

}
