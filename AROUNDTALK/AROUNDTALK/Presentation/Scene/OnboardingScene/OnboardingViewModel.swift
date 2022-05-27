import Foundation

final class OnboardingViewModel: ObservableObject {

    @Published var userEmoji: String = .init()
    @Published var IsChangeEmojiModalShown = false
    @Published var IsMovedToMainView = false

    private var fetchEmojiUseCase: FetchEmojiUseCase

    init(fetchEmojiUseCase: FetchEmojiUseCase) {
        self.fetchEmojiUseCase = fetchEmojiUseCase
    }

    func moveToMainView() {
        self.IsMovedToMainView = true
    }

    func showChangeEmojiModalView() {
        self.IsChangeEmojiModalShown = true
    }

    func fetchUserEmoji() {
        self.userEmoji = self.fetchEmojiUseCase.excute() ?? "👻"
    }

}
