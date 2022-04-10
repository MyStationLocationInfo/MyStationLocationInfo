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
    
    func getNearestSubwayStation(x: Double?, y: Double?) -> String {
        guard let lat = x, let lng = y else { return "error1"}
        
        let mapped: [String: CLLocationDistance] = Data.subways.mapValues {
            coordinate in
            
            // 현재 내 coordinate 위도,경도
            let myLat = CLLocationDegrees(lat)
            let myLong = CLLocationDegrees(lng)
            let myLocation = CLLocation(latitude: myLat, longitude: myLong)
            
            // 지하철 coordinate 위도,경도
            let stationLat = CLLocationDegrees(coordinate[0])
            let stationLong = CLLocationDegrees(coordinate[1])
            let stationLocation = CLLocation(latitude: stationLat, longitude: stationLong)
            let distance = distance(a: myLocation, b: stationLocation)
            
            return distance
        }
        
        let sortedByValue = mapped.sorted { $0.1 < $1.1 }
        let nearestStation = sortedByValue[0].key
        return nearestStation
    }
}
