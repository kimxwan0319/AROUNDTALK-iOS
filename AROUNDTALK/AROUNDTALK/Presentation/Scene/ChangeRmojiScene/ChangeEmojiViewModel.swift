import Foundation
import SwiftUI

final class ChangeEmojiViewModel: ObservableObject {

    @Published var userEmoji: String = .init()

    private var fetchEmojiUseCase: FetchEmojiUseCase
    private var setMyEmojiUseCase: SetMyEmojiUseCase

    init(fetchEmojiUseCase: FetchEmojiUseCase,
         setMyEmojiUseCase: SetMyEmojiUseCase) {
        self.fetchEmojiUseCase = fetchEmojiUseCase
        self.setMyEmojiUseCase = setMyEmojiUseCase
    }

    func fetchExistingUserEmoji() {
        self.userEmoji = self.fetchEmojiUseCase.excute() ?? "👻"
    }

    func changeEmoji() {
        self.setMyEmojiUseCase.excute(
            newEmoji: String(userEmoji.last ?? "👻")
        )
        self.userEmoji = .init()
    }

    
}
