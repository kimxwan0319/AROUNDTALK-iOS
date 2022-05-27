import SwiftUI

import MapKit

struct MapView: View {

    @EnvironmentObject var mainViewModel: MainViewModel

    let changeEmojiModalView: ChangeEmojiModalView

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(coordinateRegion: $mainViewModel.region,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: mainViewModel.chatItems,
                annotationContent: { item in
                    MapAnnotation(
                        coordinate: item.coordinate,
                        content: {
                            if item.isMine {
                                MyChatView(emoji: item.emoji, chatMessage: item.content)
                            } else {
                                ChatView(emoji: item.emoji, chatMessage: item.content)
                            }
                        }
                    )
                })
                .ignoresSafeArea()
                .task {
                    try? await self.mainViewModel.fetchArrondTalks()
                }
            Menu(content: {
                Button(action: {
                    self.mainViewModel.showChangeEmojiModalView()
                }, label: { Label("이모지 변경", systemImage: "face.smiling") } )
            }, label: {
                Text(self.mainViewModel.userEmoji)
                    .font(.system(size: 20))
                    .frame(width: 35, height: 35)
                    .background { Color.white }
                    .cornerRadius(17.5)
                    .onAppear(perform: self.mainViewModel.fetchUserEmoji)
            })
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
        .sheet(isPresented: self.$mainViewModel.IsChangeEmojiModalShown,
               onDismiss: self.mainViewModel.fetchUserEmoji
        ) { changeEmojiModalView }
    }
}
