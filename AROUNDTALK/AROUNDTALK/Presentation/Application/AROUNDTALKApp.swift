import SwiftUI

import Firebase
import LocalConsole

@main
struct AROUNDTALKApp: App {

    let dependency: AppDependency
    let consoleManager = LCManager.shared

    init() {
        FirebaseApp.configure()
        self.dependency = AppDependency.resolve()
        // self.consoleManager.isVisible = true
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
