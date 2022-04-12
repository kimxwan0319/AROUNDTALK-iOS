import SwiftUI

import MapKit

struct MapView: View {

    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        Map(
            coordinateRegion: $mainViewModel.region,
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
            }
        )
            .ignoresSafeArea()
    }
}
