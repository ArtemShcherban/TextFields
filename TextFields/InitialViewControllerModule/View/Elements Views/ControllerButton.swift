//
//  ControllerButton.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class ControllerButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        backgroundColor = .white
        setTitleColor(ColorConstants.blueColor, for: .normal)
        layer.borderWidth = 0.7
        layer.borderColor = ColorConstants.blueColor.cgColor
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 36)])
    }
}
