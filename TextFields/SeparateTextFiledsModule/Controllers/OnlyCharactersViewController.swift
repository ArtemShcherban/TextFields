//
//  OnlyCharactersViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

final class OnlyCharactersViewController: UIViewController {
    static let reuseIdentifier = String(describing: OnlyCharactersViewController.self)
    
    private lazy var textFieldMainView = TextFieldMainView()
    private lazy var onlyCharModel = OnlyCharModel()
    
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
    
    @objc func textFieldDidChanged(_ sender: OnlyCharTextField) {
        sender.text = sender.text?.uppercased()
        sender.text = onlyCharModel.maskApplication(sender.text ?? "")
    }
}
