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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = textFieldMainView
        textFieldMainView.createTextFieldView(reuseIdentifier: ValidationRulesViewController.reuseIdentifier)
        setupHideKeyboardTapGesture()
        configureMainTextField()
    }
    
    private func configureMainTextField() {
        textFieldMainView.mainTextField.delegate = self
        textFieldMainView.mainTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ sender: AdjustableTextField) {
        let result: (rulesArray: [Bool], strength: Int) = validationModel.checkPassword(sender.text ?? "")
        textFieldMainView.strengthLevelView.setStrengthLevelViewColor(result.strength)
        setRuleTextLabelColor(result.rulesArray)
    }
    
    private func setRuleTextLabelColor(_ rulesArray: [Bool]) {
        var index = 0
        rulesArray.forEach { rule in
            let textLabel = textFieldMainView.ruleTextLabelsArray[index]
            switch rule {
            case true:
                textLabel.isSatisfied = true
                textLabel.text = textLabel.text?.replacingOccurrences(of: "-", with: "+")
            case false:
                textLabel.isSatisfied = false
                textLabel.text = textLabel.text?.replacingOccurrences(of: "+", with: "-")
            }
            index += 1
        }
    }
}
