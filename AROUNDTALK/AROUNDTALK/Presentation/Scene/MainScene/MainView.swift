import SwiftUI

struct MainView: View {

    @StateObject var mainViewModel: MainViewModel

    let changeEmojiModalView: ChangeEmojiModalView

    var body: some View {
        VStack(spacing: 0) {
            MapView(changeEmojiModalView: changeEmojiModalView)
                .environmentObject(mainViewModel)
            ChatMessageInputView()
                .environmentObject(mainViewModel)
        }
        .background(Color.mainColor)
    }
}
