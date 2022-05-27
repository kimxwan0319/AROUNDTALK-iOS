import Foundation

struct AppDependency {
    let mainView: MainView
    let onboardingView: OnboardingView
    let checkIsEmojiSetUseCase: CheckIsEmojiSetUseCase
}

extension AppDependency {
    static func resolve() -> AppDependency {

        // MARK: - DataSources
        let firebaseDataBaseDataSource = FirebaseDataBaseDataSourceImpl(
            firDatabaseProvidor: FIRDatabaseProvider()
        )
        let userDefaultsDataSource = UserDefaultsDataSourceImpl()

        // MARK: - Repositories
        let chatRepository = ChatRepositoryImpl(
            firebaseDataBaseDataSource: firebaseDataBaseDataSource,
            userDefaultsDataSource: userDefaultsDataSource
        )
        let userLocationRepository = UserLocationRepositoryImpl(
            coreLocationDataSource: CoreLocationDataSourceImpl()
        )
        let emojiRepository = EmojiRepositoryImpl(
            userDefaultsDataSource: userDefaultsDataSource
        )

        // MARK: - UseCases
        let fetchEmojiUseCase = FetchEmojiUseCase(
            emojiRepository: emojiRepository
        )
        let setMyEmojiUseCase = SetMyEmojiUseCase(
            emojiRepository: emojiRepository
        )
        let fetchArroundTalksUseCase = FetchArroundTalksUseCase(
            chatRepository: chatRepository,
            userLocationRepository: userLocationRepository
        )
        let sendChatUseCase = SendChatUseCase(
            chatRepository: chatRepository,
            userLocationRepository: userLocationRepository,
            emojiRepository: emojiRepository
        )
        let checkIsEmojiSetUseCase = CheckIsEmojiSetUseCase(
            emojiRepository: emojiRepository
        )

        // MARK: - ViewModels
        let changeEmojiViewModel = ChangeEmojiViewModel(
            fetchEmojiUseCase: fetchEmojiUseCase,
            setMyEmojiUseCase: setMyEmojiUseCase
        )
        let mainViewModel = MainViewModel(
            fetchArroundTalksUseCase: fetchArroundTalksUseCase,
            fetchEmojiUseCase: fetchEmojiUseCase,
            sendChatUseCase: sendChatUseCase
        )
        let onboardingViewModel = OnboardingViewModel(
            fetchEmojiUseCase: fetchEmojiUseCase
        )
        

        // MARK: - Views
        let changeEmojiModalView = ChangeEmojiModalView(
            changeEmojiViewModel: changeEmojiViewModel
        )
        let mainView = MainView(
            mainViewModel: mainViewModel,
            changeEmojiModalView: changeEmojiModalView
        )
        let onboardingView = OnboardingView(
            onboardingViewModel: onboardingViewModel,
            changeEmojiModalView: changeEmojiModalView,
            mainView: mainView
        )

        // MARK: - return
        return AppDependency(
            mainView: mainView,
            onboardingView: onboardingView,
            checkIsEmojiSetUseCase: checkIsEmojiSetUseCase
        )
    }
}
