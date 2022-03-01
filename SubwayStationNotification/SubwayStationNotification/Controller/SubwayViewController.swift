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
    }

    
    @objc func locationUpdateMarker() {
        debugPrint("button 이벤트")
    }
    
}

extension SubwayViewController: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        debugPrint("locations = \(locValue.latitude), \(locValue.longitude)")
    }
}
