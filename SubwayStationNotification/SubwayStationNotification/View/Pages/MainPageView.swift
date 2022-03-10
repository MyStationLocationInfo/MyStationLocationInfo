//
//  MainPageView.swift
//  SubwayStationNotification
//
//  Created by 장일규 on 2022/03/07.
//

import UIKit

class MainPageView: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "🚊 터치하여 현재 역 찾기"
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }()
    
    let findButtonView: FindButtonView = FindButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: - view 세팅
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setup() {
        addSubView()
        setConstraints()
    }
    
    func addSubView() {
        addSubview(titleLabel)
        addSubview(findButtonView)
    }
    
    func setConstraints() {
        titleLabelConstratins()
        findButtonViewConstraints()
    }
    
    func titleLabelConstratins() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func findButtonViewConstraints() {
        findButtonView.translatesAutoresizingMaskIntoConstraints = false
        findButtonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        findButtonView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findButtonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
