import SwiftUI

struct ChatView: View {
    let emoji: String
    let chatMessage: String
    var body: some View {
        VStack {
            HStack(spacing: -1) {
                Text("\(emoji): \(chatMessage)")
                    .font(.system(size: 16))
                    .foregroundColor(.clear)
                Spacer(minLength: 30)
                Image.chatViewTail
                    .frame(height: 34)
                Text("\(emoji): \(chatMessage)")
                    .font(.system(size: 16))
                    .frame(height: 34)
                    .background(Color.chatColor)
                Image.chatViewHead
                    .frame(height: 34)
            }
            Spacer(minLength: 34)
        }
    }
}

