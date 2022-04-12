import SwiftUI

struct MyChatView: View {

    let emoji: String
    let chatMessage: String

    var body: some View {
        VStack {
            HStack(spacing: -1) {
                Image.myChatViewHead
                    .frame(height: 34)
                Text("\(emoji): \(chatMessage)")
                    .font(.system(size: 16))
                    .frame(height: 34)
                    .background(Color.myChatColor)
                Image.myChatViewTail
                    .frame(height: 34)
                Text("\(emoji): \(chatMessage)")
                    .font(.system(size: 16))
                    .foregroundColor(.clear)
                Spacer(minLength: 30)
            }
            Spacer(minLength: 34)
        }
    }
}
