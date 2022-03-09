//
//  FindButtonView.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/07.
//

import UIKit

class FindButtonView: UIView {
    let findButton: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.setTitle("주변 역 찾기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        return button
    }()
    
    let findButtonBackView: UIView = {
        let findButtonBackView = UIView()
        findButtonBackView.backgroundColor = .blue
        findButtonBackView.alpha = 0.3
        findButtonBackView.layer.cornerRadius = 50
        findButtonBackView.layer.masksToBounds = true
        return findButtonBackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //
    // MARK: - Button Backview Animation
    //
    func startAnimating() {
        findButtonBackView.layer.removeAnimation(forKey: "pulse")
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 1.2, 1.0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        findButtonBackView.layer.add(animation, forKey: "pulse")
    }
    
    //
    // MARK: - findButton Event
    //
    func addTarget(
        _ from: UIViewController,
        _ selector: Selector
    ) {
        findButton.addTarget(from, action: selector, for: .touchUpInside)
    }

    //
    // MARK: - addSubviews
    //
    func addSubviews() {
        addSubview(findButtonBackView)
        addSubview(findButton)
    }
    
    //
    // MARK: - Constraint
    //
    func setConstraints() {
        findButtonBackVIewConstraints()
        findButtonConstraints()
    }
    
    func findButtonConstraints() {
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        findButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func findButtonBackVIewConstraints() {
        findButtonBackView.translatesAutoresizingMaskIntoConstraints = false
        findButtonBackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonBackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonBackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findButtonBackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
