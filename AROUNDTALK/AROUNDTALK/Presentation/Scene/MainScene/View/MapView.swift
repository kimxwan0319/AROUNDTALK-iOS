import SwiftUI

import MapKit

struct MapView: View {

    @StateObject var mainViewModel: MainViewModel

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
                        ChatView(chatMessage: item.content)
                    }
                )
            }
        )
            .ignoresSafeArea()
    }
}
