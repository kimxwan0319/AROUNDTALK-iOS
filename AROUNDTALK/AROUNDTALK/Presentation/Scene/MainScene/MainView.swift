import SwiftUI

struct MainView: View {

    @StateObject var mainViewModel: MainViewModel

    var body: some View {
        VStack(spacing: 0) {
            MapView()
                .environmentObject(mainViewModel)
            ChatMessageInputView()
                .environmentObject(mainViewModel)
        }
        .background(Color.mainColor)
    }
}
