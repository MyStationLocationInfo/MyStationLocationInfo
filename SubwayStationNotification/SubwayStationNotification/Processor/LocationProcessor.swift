//
//  LocationProcessor.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/02/27.
//

import Foundation
import CoreLocation

class LocationProcessor{
    let manager: CLLocationManager
    init() {
        self.manager = CLLocationManager()
        self.manager.requestAlwaysAuthorization()
        self.manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.manager.startUpdatingLocation()
    }
}
