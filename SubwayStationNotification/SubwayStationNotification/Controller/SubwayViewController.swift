//
//  SubwayViewController.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/02/27.
//

import UIKit
import MapKit
import Lottie

class SubwayViewController: UIViewController {
    
    // MARK: - constant Property
    let locationManager = LocationProcessor()
    let subwayManager = SubwayProcessor()
    let designProcessor = DesignProcessor()

    // MARK: - variable Property
    var latitude: Double?
    var longitude: Double?

    //MARK: - Pages
    let mainPageView: MainPageView = MainPageView()
    
    let metroLottie: AnimationView = {
        let metroLottie:AnimationView = AnimationView(name: "metro")
        metroLottie.play(
            fromFrame: 0,
            toFrame: 200,
            loopMode: .loop,
            completion: nil
        )
        metroLottie.animationSpeed = 2
        metroLottie.alpha = 0
        
        return metroLottie
    }()

    override func viewDidLoad() {
        let gradientLayer = designProcessor.getGradientLayer(view)
        view.layer.addSublayer(gradientLayer)
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
        view.addSubview(metroLottie)
    }
    
    func setConstraints() {
        pageViewConstraints(subview: mainPageView)
        metroLottieConstratins()
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
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            animations: {
                self.mainPageView.findButtonView.alpha = 0
            }) { _ in
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    animations: {
                        self.metroLottie.alpha = 1
                    })
            }
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
    
    func metroLottieConstratins() {
        metroLottie.translatesAutoresizingMaskIntoConstraints = false
        metroLottie.widthAnchor.constraint(equalToConstant: 200).isActive = true
        metroLottie.heightAnchor.constraint(equalToConstant: 200).isActive = true
        metroLottie.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        metroLottie.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
