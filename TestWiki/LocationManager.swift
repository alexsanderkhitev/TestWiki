//
//  LocationManager.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/6/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    private let manager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?
    
    func requestLocation() {
        manager.delegate = self
        if CLLocationManager.authorizationStatus() != .AuthorizedAlways || CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
        manager.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print(status)
        requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations, locations.first?.coordinate)
        guard let coordinate = locations.first?.coordinate else { return }
        delegate?.didReceiveCoordinate?(coordinate)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
}