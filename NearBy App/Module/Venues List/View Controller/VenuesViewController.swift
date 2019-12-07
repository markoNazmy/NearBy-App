//
//  VenuesViewController.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Result
import CoreLocation

class VenuesViewController: UIViewController {
    
    enum State: String {
        case singleUpdate
        case realtime
    }
    
    var state: State {
        get {
            let defaults = UserDefaults.standard
            if let value = defaults.object(forKey: "LocationMode") as? String, let mode = State(rawValue: value) {
                return mode
            } else {
                defaults.set(State.singleUpdate.rawValue, forKey: "LocationMode")
                return .singleUpdate
            }
        }
    }
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

//        NetworkManager.shared.start(request: VenuesRequest.getPhotos(photoId: "51eabef6498e10cf3aea7942")) { (result: Result<VenuePhotosResp, AppError>) in
//            print(result)
//        }
        setupLoactionManager()
    }
    
    func setupLoactionManager() {
        if CLLocationManager.authorizationStatus() != .authorizedAlways && CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        activeLocationManager()
    }
    
    func activeLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 500
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
    }
    
}

extension VenuesViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if state == .singleUpdate {
                locationManager.stopUpdatingLocation()
            }
            NetworkManager.shared.start(request: VenuesRequest.getVenues(latLang: "\(location.coordinate.latitude),\(location.coordinate.longitude)", limit: 10, offest: 1)) { (result: Result<Venues, AppError>) in
                print(result)
            }
        }
    }
}
