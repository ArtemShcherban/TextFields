//
//  InputLimitViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

final class InputLimitViewController: UIViewController {
    static let reuseIdentifier = String(describing: InputLimitViewController.self)
    
    private lazy var textFieldMainView = TextFieldMainView()
    private lazy var inputLimitModel = InputLimitModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = textFieldMainView
        textFieldMainView.createTextFieldView(reuseIdentifier: Self.reuseIdentifier)
        setupHideKeyboardTapGesture()
        configureMainTextField()
    }
    
    private func configureMainTextField() {
        textFieldMainView.mainTextField.delegate = self
        textFieldMainView.mainTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ sender: InputLimitTextField) {
        textFieldMainView.countTextLabel.text = inputLimitModel.characterCounter(sender.text ?? "")
        sender.setColors()
        textFieldMainView.countTextLabel.setTextColor()
    }
}
