//
//  SubwayViewController.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/02/27.
//

import UIKit
import MapKit

class SubwayViewController: UIViewController {
    
    let locationManager = LocationProcessor()
    let subwayManager = SubwayProcessor()
    var latitude: Double?
    var longitude: Double?
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.text = "🚊터치하여 현재 station search하기"
            titleLabel.textColor = .black
            titleLabel.font = UIFont(name: "bold", size: 25)
            titleLabel.adjustsFontSizeToFitWidth = true
        
            return titleLabel
    }()
    
    let button: UIButton = {
      let button = UIButton()
        button.setTitle("현재 역 위치", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(locationUpdateMarker), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        addViews()
        setConstraints()
        configureLocationManager()
    }
    
    func addViews() {
        view.addSubview(titleLabel)
        view.addSubview(button)
    }
    
    func setConstraints() {
        titleLabelConstraints()
        buttonConstraints()
    }
    
    func configureLocationManager() {
        locationManager.manager.delegate = self
    }
    
    func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: -60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(locationUpdateMarker), for: .touchUpInside)
    }

    
    @objc func locationUpdateMarker() {
        let mapped: [String: CLLocationDistance] = Data.subways.mapValues { coordinate in
            
            guard let latitude = latitude else { return 0.0 }
            guard let longitude = longitude else { return 0.0 }
            
            // 현재 내 coordinate 위도,경도
            let myLat = CLLocationDegrees(latitude)
            let myLong = CLLocationDegrees(longitude)
            let myLocation = CLLocation(latitude: myLat, longitude: myLong)
            
            // 지하철 coordinate 위도,경도
            let stationLat = CLLocationDegrees(coordinate[0])
            let stationLong = CLLocationDegrees(coordinate[1])
            let stationLocation = CLLocation(latitude: stationLat, longitude: stationLong)
            let distance = subwayManager.distance(a: myLocation, b: stationLocation)
            return distance
        }
        
                
        debugPrint(mapped.sorted { $0.1 < $1.1 })
    }
    
}

extension SubwayViewController: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.latitude = locValue.latitude
        self.longitude = locValue.longitude
        debugPrint("locations = \(locValue.latitude), \(locValue.longitude)")
    }
}
