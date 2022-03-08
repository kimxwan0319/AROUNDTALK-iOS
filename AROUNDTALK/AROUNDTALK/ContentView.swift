//
//  ContentView.swift
//  AROUNDTALK
//
//  Created by 김수완 on 2022/03/08.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            MapView()
            TextInputView()
        }
        .background(Color("MainColor"))
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .ignoresSafeArea()
    }
}

struct TextInputView: View {
    @State var chat: String = ""
    var body: some View {
        HStack {
            TextField("", text: $chat)
                .font(.system(size: 18))
                .padding(EdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 0
                ))
            Button(
                action: {},
                label: { Image(systemName: "arrow.up")
                    .tint(Color(uiColor: .white))
                }
            )
            .frame(width: 26, height: 26)
            .background(Color("AccentColor"))
            .cornerRadius(13)
            .padding(EdgeInsets(
                top: 4,
                leading: 0,
                bottom: 4,
                trailing: 6
            ))
        }
        .frame(height: 34)
        .overlay(
            RoundedRectangle(cornerRadius: 17)
                .stroke(.gray, lineWidth: 1)
        )
        .padding(14)
        .background(Color("MainColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
