//
//  SubtitleTextLabel.swift
//  TextFields
//
//  Created by Artem Shcherban on 11.02.2022.
//

import UIKit

final class AdjustableTextLabel: UILabel {
    private let satisfiedColor = UIColor.green
    private let unSatisfiedColor = ColorConstants.graphiteColor
    
    var isSatisfied = false {
        didSet {
            if oldValue != isSatisfied {
                setTextColor()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setTextColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        setTextColor()
    }
        
        private func setTextColor() {
            textColor = isSatisfied ? satisfiedColor : unSatisfiedColor
        }
    
    private func configure() {
        backgroundColor = .white
        font = UIFont(name: FontConstants.rubikRegular.rawValue, size: 13)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        attributedText = NSMutableAttributedString(string: " ", attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}
