//
//  SearchingPageView.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/16.
//

import UIKit
import Lottie

class SearchingPageView: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "현재 역 찾는중 ..."
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }()
    
    let metroLottie: AnimationView = {
        let metroLottie:AnimationView = AnimationView(name: "metro")
        return metroLottie
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSubView()
        setConstraints()
        startAnimating()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setup() {
        alpha = 0
    }
    
    func addSubView() {
        addSubview(titleLabel)
        addSubview(metroLottie)
    }
    
    func setConstraints() {
        titleLabelConstratins()
        loadingAnimationViewConstraints()
    }
    
    func startAnimating() {
        metroLottie.play(
            fromFrame: 0,
            toFrame: 80,
            loopMode: .loop,
            completion: nil)
    }

    
    private func titleLabelConstratins() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func loadingAnimationViewConstraints() {
        metroLottie.translatesAutoresizingMaskIntoConstraints = false
        metroLottie.widthAnchor.constraint(equalToConstant: 200).isActive = true
        metroLottie.heightAnchor.constraint(equalToConstant: 200).isActive = true
        metroLottie.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        metroLottie.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
