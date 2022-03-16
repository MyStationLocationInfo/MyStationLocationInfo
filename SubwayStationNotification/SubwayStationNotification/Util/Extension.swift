//
//  Extension.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/15.
//

import UIKit

extension UIView {
  func removeAllConstraints() {
    self.removeConstraints(self.constraints)
    for view in self.subviews {
      view.removeAllConstraints()
    }
  }
}
