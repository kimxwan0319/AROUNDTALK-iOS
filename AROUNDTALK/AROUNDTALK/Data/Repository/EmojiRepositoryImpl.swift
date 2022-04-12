import Foundation

class EmojiRepositoryImpl: EmojiRepository {

    private let userDefaultsDataSource: UserDefaultsDataSource

    init(userDefaultsDataSource: UserDefaultsDataSource) {
        self.userDefaultsDataSource = userDefaultsDataSource
    }

    func fetchMyEmoji() -> String? {
        self.userDefaultsDataSource.fetchMyEmoji()
    }
    
    func setMyEmoji(newEmoji: String) {
        self.userDefaultsDataSource.setMyEmoji(newEmoji: newEmoji)
    }

}
