//
//  SSNAnimation.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/15.
//

import UIKit

class SSNAnimation {
    //MARK: - Animation show.
    func show(
        view: UIView,
        duration: TimeInterval,
         completion: (() -> Void)?
    ) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                view.alpha = 1
            },
            completion: {  _ in
                completion?()
            }
        )
    }

    //MARK: - Animation hide.
    func hide(
        view: UIView,
        duration: TimeInterval,
        completion:  (() -> Void)?
    ){
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                view.alpha = 0
            },
            completion: {  _ in
                completion?()
            }
        )
    }
    
}
