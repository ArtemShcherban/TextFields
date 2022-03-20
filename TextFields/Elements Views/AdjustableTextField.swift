//
//  AdjustableTextField.swift
//  TextFields
//
//  Created by Artem Shcherban on 11.02.2022.
//

import UIKit

class AdjustableTextField: UITextField {
    private let activeBorderColor = ColorConstants.blueColor.cgColor
    private let inactiveBorderColor = ColorConstants.grayColor.withAlphaComponent(0.12).cgColor
    
    var isActive = false {
        didSet {
            guard oldValue != isActive else { return }
            update()
        }
    }
    
    private func update() {
        layer.borderColor = isActive ? activeBorderColor  : inactiveBorderColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        backgroundColor = ColorConstants.grayColor.withAlphaComponent(0.12)
        borderStyle = .roundedRect
        layer.borderWidth = 0.7
        layer.cornerRadius = 10
        clipsToBounds = true
        NSLayoutConstraint.activate( [heightAnchor.constraint(equalToConstant: 36)])
        update()
    }
}
