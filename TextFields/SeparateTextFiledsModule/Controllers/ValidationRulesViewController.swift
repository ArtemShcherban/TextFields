//
//  ValidationRulesViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

final class ValidationRulesViewController: UIViewController {
    static let reuseIdentifier = String(describing: ValidationRulesViewController.self)
    
    private lazy var textFieldMainView = TextFieldMainView()
    private lazy var validationModel = ValidationModel()
    
    override func loadView() {
        view = textFieldMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldMainView.createTextFieldView(reuseIdentifier: ValidationRulesViewController.reuseIdentifier)
        setupHideKeyboardTapGesture()
        configureMainTextField()
    }
    
    private func configureMainTextField() {
        textFieldMainView.mainTextField.delegate = self
        textFieldMainView.mainTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc private func textFieldDidChanged(_ sender: AdjustableTextField) {
        let result: (rules: [Bool], strength: Int) = validationModel.checkPassword(sender.text ?? "")
        textFieldMainView.strengthLevelView.setStrengthLevelViewColor(result.strength)
        setRuleTextLabelColor(result.rules)
    }
    
    private func setRuleTextLabelColor(_ rules: [Bool]) {
        for (index, rule) in rules.enumerated() {
            let textLabel = textFieldMainView.ruleTextLabelsArray[index]
            switch rule {
            case true:
                textLabel.isSatisfied = true
                textLabel.text = textLabel.text?.replacingOccurrences(of: "-", with: "+")
            case false:
                textLabel.isSatisfied = false
                textLabel.text = textLabel.text?.replacingOccurrences(of: "+", with: "-")
            }
        }
    }
}
