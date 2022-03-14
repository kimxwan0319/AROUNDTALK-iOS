import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    var body: some View {
        VStack(spacing: 0) {
            MapView(mainViewModel: mainViewModel)
                .onAppear {
                    mainViewModel.checkIfLocationServicesIsEnalbe()
                }
            ChatMessageInputView(mainViewModel: mainViewModel)
        }
        .background(Color("MainColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

