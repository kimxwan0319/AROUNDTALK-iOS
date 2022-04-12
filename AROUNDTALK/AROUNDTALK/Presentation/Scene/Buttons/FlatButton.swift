import SwiftUI

struct FlatButton: View {
    let buttonText: String
    let action: () -> Void
    var body: some View {
        HStack {
            Button(action: {
                action()
            }, label: {
                Text(buttonText)
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
            })
                .background(Color.accentColor)
        }
    }
}
