//
//  SubwayProcessor.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/02/27.
//

import Foundation
import CoreLocation

class SubwayProcessor {
    
    func distance(a: CLLocation, b: CLLocation) -> CLLocationDistance {
        let distance = a.distance(from: b)
        return distance
    }
    
}
