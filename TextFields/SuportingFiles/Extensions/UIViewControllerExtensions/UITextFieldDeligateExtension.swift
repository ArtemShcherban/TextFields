//
//  UITextFieldDeligate.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textField = textField as? AdjustableTextField {
            textField.isActive = true
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if let textField = textField as? AdjustableTextField {
            textField.isActive = false
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
