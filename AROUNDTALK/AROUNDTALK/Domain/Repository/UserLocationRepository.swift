import Foundation

import CoreLocation

protocol UserLocationRepository {
    func fetchMyLocation() -> CLLocation
    func reverseGeocodeNowLocation() async -> CLPlacemark
}
