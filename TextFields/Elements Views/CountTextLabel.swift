//
//  CountTextLabel.swift
//  TextFields
//
//  Created by Artem Shcherban on 13.02.2022.
//

import UIKit

final class CountTextLabel: UILabel {
    
    override var text: String? {
            didSet {
                if oldValue != text {
                    updateTextColor()
                }
            }
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
        backgroundColor = .clear
        textAlignment = .right
        font = UIFont(name: FontConstants.sfProDisplayRegular.rawValue, size: 13)
        attributedText = NSMutableAttributedString(string: "\(AppConstants.maxNumberOfCharacters)",
                                                   attributes: [NSAttributedString.Key.kern: -0.41])
    }
    
    func updateTextColor() {
        if Int(text ?? "") ?? 0 < 0 {
            textColor = .red
        } else {
            textColor = ColorConstants.graphiteColor
        }
    }
}
