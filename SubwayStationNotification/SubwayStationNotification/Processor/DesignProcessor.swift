//
//  DesignProcessor.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/14.
//

import UIKit

class DesignProcessor {
    func getGradientLayer(_ view: UIView) -> CAGradientLayer {
        let colors: [CGColor] = [
           .init(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),
           .init(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1),
           .init(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        ]
        
        let changeColors: [CGColor] = [
           .init(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
           .init(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
           .init(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        ]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame  = view.bounds
        gradientLayer.colors = colors
        view.layer.addSublayer(gradientLayer)
        
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.toValue = changeColors
        colorAnimation.duration = 3
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = .infinity
        gradientLayer.add(colorAnimation, forKey: "colorChangeAnimation")
        
        return gradientLayer
    }
}
