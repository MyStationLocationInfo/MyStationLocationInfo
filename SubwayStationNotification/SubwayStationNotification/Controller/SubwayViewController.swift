//
//  SubwayViewController.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/02/27.
//

import UIKit
import MapKit

class SubwayViewController: UIViewController {
    
    // MARK: - constant Property
    let locationManager = LocationProcessor()
    let subwayManager = SubwayProcessor()
    
    // MARK: - variable Property
    var latitude: Double?
    var longitude: Double?
    var gradientLayer: CAGradientLayer = CAGradientLayer()

    //MARK: - Pages
    let mainPageView: MainPageView = MainPageView()

    override func viewDidLoad() {
        getGradientLayer()
        setup()
    }
    
    func setup() {
        addViews()
        setConstraints()
        configureLocationManager()
        configureFindButton()
    }
    
    func addViews() {
        view.addSubview(mainPageView)
    }
    
    func setConstraints() {
        pageViewConstraints(subview: mainPageView)
    }
    
    func configureLocationManager() {
        locationManager.manager.delegate = self
    }
    
    // MARK: - configureFindButton
    func configureFindButton() {
        mainPageView.findButtonView.addTarget(self, #selector(handleFindButton))
    }
    
    // MARK: - handleFindButton
    @objc func handleFindButton() {
        debugPrint("handleFindButton")
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
    
    func pageViewConstraints(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalToConstant: 300).isActive = true
        subview.heightAnchor.constraint(equalToConstant: 300).isActive = true
        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func getGradientLayer() {
        let colors: [CGColor] = [
           .init(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),
           .init(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1),
           .init(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        ]
        
        self.gradientLayer.frame  = self.view.bounds
        self.gradientLayer.colors = colors
        self.view.layer.addSublayer(gradientLayer)
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
