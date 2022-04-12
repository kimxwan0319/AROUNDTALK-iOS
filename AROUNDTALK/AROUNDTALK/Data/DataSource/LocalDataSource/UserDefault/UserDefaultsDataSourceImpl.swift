import Foundation

enum UserDefaultsKey: String {
    case myChatCodes = "MY-CHAT-CODES"
    case myEmoji = "MY-EMOJI"
}

class UserDefaultsDataSourceImpl: UserDefaultsDataSource {

    private var userDefaults = UserDefaults.standard

    func fetchMyChatCodes() -> [String] {
        return self.userDefaults.array(forKey: UserDefaultsKey.myChatCodes.rawValue) as? [String] ?? []
    }

    func addMyChatCode(newChatCode: String) {
        var myChatCodes = fetchMyChatCodes()
        myChatCodes.append(newChatCode)
        self.userDefaults.set(myChatCodes, forKey:  UserDefaultsKey.myChatCodes.rawValue)
    }

    func fetchMyEmoji() -> String? {
        return self.userDefaults.string(forKey: UserDefaultsKey.myEmoji.rawValue)
    }

    func setMyEmoji(newEmoji: String) {
        self.userDefaults.set(newEmoji, forKey: UserDefaultsKey.myEmoji.rawValue)
    }

}
