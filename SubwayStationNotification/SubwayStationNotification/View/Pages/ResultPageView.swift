//
//  ResultPageView.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/19.
//

import UIKit

class ResultPageView: UIView {

    let findButtonView: FindButtonView = FindButtonView()

    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSubView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setup() {
        alpha = 1
    }
    
    func addSubView() {
        addSubview(titleLabel)
        addSubview(findButtonView)
    }
    
    func setConstraints() {
        titleLabelConstratins()
        findButtonViewConstraints()
    }
    
    private func titleLabelConstratins() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func findButtonViewConstraints() {
        findButtonView.translatesAutoresizingMaskIntoConstraints = false
        findButtonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findButtonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
