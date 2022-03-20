//
//  NoDightsViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 14.03.2022.
//

import UIKit

final class NoDightsViewController: UIViewController {
    
    static let reuseIdentifier = String(describing: NoDightsViewController.self)
    
    private lazy var textFieldMainView = TextFieldMainView()
    private lazy var noDightsModel = NoDightsModel()
    
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
    
    @objc func textFieldDidChanged(_ sender: AdjustableTextField) {
        sender.text = noDightsModel.digitsExclusion(sender.text ?? "")
    }
}
