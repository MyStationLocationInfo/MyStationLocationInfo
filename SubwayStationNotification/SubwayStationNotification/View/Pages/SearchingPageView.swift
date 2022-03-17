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
        metroLottie.play(
            fromFrame: 0,
            toFrame: 200,
            loopMode: .loop,
            completion: nil
        )
        metroLottie.animationSpeed = 2
        
        return metroLottie
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
