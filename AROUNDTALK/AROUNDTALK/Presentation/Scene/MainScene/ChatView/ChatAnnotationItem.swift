import Foundation

import CoreLocation

struct ChatAnnotationItem: Identifiable {
    let id: UUID = UUID()
    var code: String
    var isMine: Bool = false
    var emoji: String
    let content: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension ChatAnnotationItem: Hashable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
      return lhs.code == rhs.code
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
}
