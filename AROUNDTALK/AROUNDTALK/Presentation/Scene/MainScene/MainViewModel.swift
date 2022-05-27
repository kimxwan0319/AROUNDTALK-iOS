import Foundation

import MapKit

final class MainViewModel: NSObject, ObservableObject {

    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        latitudinalMeters: 100,
        longitudinalMeters: 100
    )
    @Published var userEmoji: String = .init()
    @Published var chatText: String = .init()
    @Published var chatItems: [ChatAnnotationItem] = .init()
    @Published var IsChangeEmojiModalShown = false

    private var fetchArroundTalksUseCase: FetchArroundTalksUseCase
    private var fetchEmojiUseCase: FetchEmojiUseCase
    private var sendChatUseCase: SendChatUseCase


    init(fetchArroundTalksUseCase: FetchArroundTalksUseCase,
         fetchEmojiUseCase: FetchEmojiUseCase,
         sendChatUseCase: SendChatUseCase) {
        self.fetchArroundTalksUseCase = fetchArroundTalksUseCase
        self.fetchEmojiUseCase = fetchEmojiUseCase
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

    func fetchUserEmoji() {
        self.userEmoji = self.fetchEmojiUseCase.excute()!
    }

    func sendChat() async throws {
        DispatchQueue.main.async { [weak self] in self?.chatText = "" }
        try await sendChatUseCase.execute(content: self.chatText)
    }

    func showChangeEmojiModalView() {
        self.IsChangeEmojiModalShown = true
    }

}

extension MainViewModel {

    private func insertChatItemWithDeduplication(_ chatItem: ChatAnnotationItem) {
        DispatchQueue.main.async { [weak self] in
            if let self = self {
                var chatItemsAsSet = Set(self.chatItems)
                chatItemsAsSet.insert(chatItem)
                self.chatItems = Array(chatItemsAsSet)
            }
        }
    }

}
