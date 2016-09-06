//
//  LocationManagerDelegate.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/6/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import Foundation
import CoreLocation

@objc protocol LocationManagerDelegate {
    
    optional func didReceiveCoordinate(coordinate: CLLocationCoordinate2D)
}