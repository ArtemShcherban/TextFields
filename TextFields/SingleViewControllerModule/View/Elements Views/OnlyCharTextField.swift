//
//  onlyCharTextField.swift
//  TextFields
//
//  Created by Artem Shcherban on 17.02.2022.
//

import Foundation
import UIKit

class OnlyCharTextField: AdjustableTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        autocorrectionType = .no
        spellCheckingType = .no
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
