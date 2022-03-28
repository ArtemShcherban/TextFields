//
//  TitleTextLable.swift
//  TextFields
//
//  Created by Artem Shcherban on 14.03.2022.
//

import UIKit

final class TitleTextLabel: UILabel {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        textColor = ColorConstants.graphiteColor
        font = UIFont(name: FontConstants.rubikMedium.rawValue, size: 34)
        textAlignment = .center
    }
}
