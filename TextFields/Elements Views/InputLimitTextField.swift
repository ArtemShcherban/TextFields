//
//  InputLimitTextField.swift
//  TextFields
//
//  Created by Artem Shcherban on 14.02.2022.
//

import UIKit

final class InputLimitTextField: AdjustableTextField {
    
    let limit = AppConstants.maxNumberOfCharacters
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func setColors() {
        if (text?.count ?? 0) < limit {
            layer.borderColor = ColorConstants.blueColor.cgColor
            
        } else if (text?.count ?? 0) == limit {
            layer.borderColor = ColorConstants.blueColor.cgColor
            
        } else if text?.count ?? 0 > limit {
            setTextColor()
            layer.borderColor = UIColor.red.cgColor
        }
    }
    
    private func setTextColor() {
        let startRange = NSRange(location: 0, length: limit)
        let endRange = NSRange(location: limit, length: (text?.count ?? 0) - limit)
        let string = NSMutableAttributedString(string: text ?? "")
        string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: endRange)
        string.addAttribute(NSAttributedString.Key.foregroundColor, value: ColorConstants.graphiteColor, range: startRange)
        attributedText = string
    }
    
    private func configure() {
        textColor = ColorConstants.graphiteColor
    }
}
