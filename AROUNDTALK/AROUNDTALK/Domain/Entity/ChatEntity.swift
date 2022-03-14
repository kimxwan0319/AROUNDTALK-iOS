import Foundation

import CoreLocation

struct ChatEntity: Identifiable {
    let id = UUID()
    let isMine: Bool
    var content: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
