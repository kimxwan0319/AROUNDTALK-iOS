import Foundation

import CoreLocation

protocol CoreLocationDataSource {
    func fetchMyLocation() -> CLLocation
    func reverseGeocodeNowLocation() async -> CLPlacemark
}
