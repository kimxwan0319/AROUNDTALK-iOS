import Foundation

import CoreLocation

class CoreLocationDataSourceImpl: NSObject, CoreLocationDataSource {

    private var locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
    }

    func fetchMyLocation() -> CLLocation {
        return self.locationManager.location!
    }

    func reverseGeocodeNowLocation() async -> CLPlacemark {
        let clGeocoder = CLGeocoder()
        return await withCheckedContinuation { continuation in
            clGeocoder.reverseGeocodeLocation(self.fetchMyLocation()) { placemarks, _ in
                continuation.resume(returning: placemarks!.first!)
            }
        }
    }

}

extension CoreLocationDataSourceImpl: CLLocationManagerDelegate {

    // Private Method
    private func checkLocationAuthorization() {
        switch self.locationManager.authorizationStatus {
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
        default:
            break
        }

    }

    // Delegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkLocationAuthorization()
    }

}
