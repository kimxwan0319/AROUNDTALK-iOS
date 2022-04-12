import SwiftUI

struct ChangeEmojiModalView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var changeEmojiViewModel: ChangeEmojiViewModel

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                EmojiTextField(
                    text: self.$changeEmojiViewModel.userEmoji ,
                    font: .systemFont(ofSize: 100),
                    textAlignment: .center,
                    tintColor: .clear
                )
                    .frame(width: 160, height: 160)
                    .background { Color.white }
                    .cornerRadius(80)
                    .onAppear(perform: self.changeEmojiViewModel.fetchExistingUserEmoji)
                Spacer()
                Spacer()
                FlatButton(
                    buttonText: "확인",
                    action: {
                        self.changeEmojiViewModel.changeEmoji()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
            }
            .background { Color.mainColor.ignoresSafeArea() }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.backward")
                            Text("Cancel")
                        })
                    }
                }
            }
        }
    }
}
