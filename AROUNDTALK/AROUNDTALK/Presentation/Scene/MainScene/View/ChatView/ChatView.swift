import SwiftUI

struct ChatView: View {
    let chatMessage: String
    var body: some View {
        VStack {
            HStack(spacing: -1) {
                Text(chatMessage)
                    .font(.system(size: 16))
                    .foregroundColor(.clear)
                Spacer(minLength: 30)
                Image("ChatViewTail")
                    .frame(height: 34)
                Text(chatMessage)
                    .font(.system(size: 16))
                    .frame(height: 34)
                    .background(Color("ChatColor"))
                Image("ChatViewHead")
                    .frame(height: 34)
            }
            Spacer(minLength: 34)
        }
    }
}

