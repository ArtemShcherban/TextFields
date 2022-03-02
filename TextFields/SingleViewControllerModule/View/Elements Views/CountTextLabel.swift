//
//  CountTextLabel.swift
//  TextFields
//
//  Created by Artem Shcherban on 13.02.2022.
//

import Foundation
import UIKit

final class CountTextLabel: UILabel {
    private let activeColor = UIColor.red
    private let inactiveColor = ColorConstants.graphiteColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        backgroundColor = .clear
        textAlignment = .right
        font = UIFont(name: FontConstants.sfProDisplayRegular.rawValue, size: 13)
        attributedText = NSMutableAttributedString(string: "\(AppConstants.maxNumberOfCharacters)",
                                                   attributes: [NSAttributedString.Key.kern: -0.41])
    }
    
    func setTextColor() {
        if Int(text ?? "") ?? 0 < 0 {
            textColor = .red
        } else {
            textColor = ColorConstants.graphiteColor
        }
    }
}
