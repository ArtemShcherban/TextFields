//
//  StrengthLevelView.swift
//  TextFields
//
//  Created by Artem Shcherban on 20.02.2022.
//

import Foundation
import UIKit

final class StrengthLevelView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func setStrengthLevelViewColor(_ passwordStrength: Int) {
        gradientLayer.frame = bounds
        gradientLayer.locations = [NSNumber(value: 0.0), NSNumber(value: 0.5), NSNumber(value: 0.5), NSNumber(value: 1.0)]
        setGradientColor(passwordStrength)
    }
    
    private func setGradientColor(_ passwordStrength: Int) {
        switch passwordStrength {
        case 1:
            gradientLayer.colors = [UIColor.red.cgColor, UIColor.red.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        case 2:
            gradientLayer.colors = [UIColor.orange.cgColor, UIColor.orange.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case 3:
            gradientLayer.colors = [UIColor.orange.cgColor, UIColor.orange.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case 4:
            gradientLayer.colors = [UIColor.green.cgColor, UIColor.green.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        default:
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        }
    }
    
    private func configure() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 8)])
        setStrengthLevelViewColor(0)
        layer.addSublayer(gradientLayer)
    }
}
