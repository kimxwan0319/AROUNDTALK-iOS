import SwiftUI

struct OnboardingView: View {

    @StateObject var onboardingViewModel: OnboardingViewModel
    
    let changeEmojiModalView: ChangeEmojiModalView
    let mainView: MainView

    var body: some View {
        VStack {
            Spacer()
            Text("AROUNDTALK")
                .font(.system(size: 35).bold())
            Text("세계 최초 채팅 지도  세계 최초 채팅 지도  세계 최초 채팅 지도  ")
                .font(.system(size: 9).bold())
            Spacer().frame(height: 50)
            Text(self.onboardingViewModel.userEmoji)
                .font(.system(size: 100))
                .frame(width: 160, height: 160)
                .background { Color.white }
                .cornerRadius(80)
                .onAppear(perform: self.onboardingViewModel.fetchUserEmoji)
            Button(action: {
                self.onboardingViewModel.showChangeEmojiModalView()
            }, label: {
                Text("이모티콘 변경")
                    .font(.system(size: 12))
            })
            Spacer()
            Spacer()
            DefaultButton(
                buttonText: "시작하기",
                action: {
                    print("start")
                }
            )
        }
        .background { Color.mainColor }
        .ignoresSafeArea(.all)
        .sheet(isPresented: self.$onboardingViewModel.IsChangeEmojiModalShown,
               onDismiss: self.onboardingViewModel.fetchUserEmoji
        ) { changeEmojiModalView }
        .fullScreenCover(isPresented: self.$onboardingViewModel.IsMovedToMainView) {
            mainView
        }
    }
}
