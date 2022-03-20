//
//  HideKeyboardExtension.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

public extension UIViewController {
    
    func setupHideKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
