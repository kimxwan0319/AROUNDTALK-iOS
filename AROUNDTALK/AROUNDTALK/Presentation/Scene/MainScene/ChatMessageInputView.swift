import SwiftUI

struct ChatMessageInputView: View {

    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        HStack {
            TextField("", text: $mainViewModel.chatText)
                .font(.system(size: 18))
                .padding(EdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 0
                ))
            Button(
                action: {
                    Task {
                        try? await mainViewModel.sendChat()
                    }
                },
                label: { Image(systemName: "arrow.up")
                    .tint(Color(uiColor: .white))
                }
            )
                .frame(width: 26, height: 26)
                .background(Color.accentColor)
                .cornerRadius(13)
                .padding(EdgeInsets(
                    top: 4,
                    leading: 0,
                    bottom: 4,
                    trailing: 6
                ))
                .disabled(mainViewModel.chatText.isEmpty)
        }
        .frame(height: 34)
        .overlay(
            RoundedRectangle(cornerRadius: 17)
                .stroke(.gray, lineWidth: 1)
        )
        .padding(14)
        .background(Color.mainColor)
    }
}
