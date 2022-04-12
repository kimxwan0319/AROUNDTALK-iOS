import Foundation

import CoreLocation

class UserLocationRepositoryImpl: UserLocationRepository {

    private let coreLocationDataSource: CoreLocationDataSource

    init(coreLocationDataSource: CoreLocationDataSource) {
        self.coreLocationDataSource = coreLocationDataSource
    }

    func fetchMyLocation() -> CLLocation {
        coreLocationDataSource.fetchMyLocation()
    }

    func reverseGeocodeNowLocation() async -> CLPlacemark {
        await coreLocationDataSource.reverseGeocodeNowLocation()
    }

}
