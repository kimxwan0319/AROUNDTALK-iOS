import SwiftUI

import Firebase

@main
struct AROUNDTALKApp: App {

    let dependency: AppDependency

    init() {
        FirebaseApp.configure()
        self.dependency = AppDependency.resolve()
    }

    var body: some Scene {
        WindowGroup {
            if self.dependency.checkIsEmojiSetUseCase.excute() {
                dependency.mainView
            } else {
                dependency.onboardingView
            }
        }
    }
}
