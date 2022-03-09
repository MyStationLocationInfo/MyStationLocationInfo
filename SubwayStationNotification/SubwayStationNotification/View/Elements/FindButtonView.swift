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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    func addSubviews() {
        addSubview(findButton)
    }
    
    func setConstraints() {
        findButtonConstraints()
    }

    func findButtonConstraints() {
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        findButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        findButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        findButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
