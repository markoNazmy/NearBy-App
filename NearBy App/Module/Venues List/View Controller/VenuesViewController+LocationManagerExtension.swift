//
//  VenuesViewController+LocationManagerExtension.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import CoreLocation

extension VenuesViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if presenter.state == .singleUpdate {
                locationManager.stopUpdatingLocation()
            }
            presenter.getVenues(latlang: "\(location.coordinate.latitude),\(location.coordinate.longitude)", shouldRefresh: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
