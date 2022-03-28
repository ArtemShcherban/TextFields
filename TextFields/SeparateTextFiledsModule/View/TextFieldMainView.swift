//
//  NoDightsView.swift
//  TextFields
//
//  Created by Artem Shcherban on 14.03.2022.
//

import UIKit

final class TextFieldMainView: UIView {
    
    private let title = TitleTextLabel()
    var mainTextField = AdjustableTextField()
    var countTextLabel = CountTextLabel()
    var strengthLevelView = StrengthLevelView()
    private lazy var eightCharactersRule = AdjustableTextLabel()
    private lazy var oneDightRule = AdjustableTextLabel()
    private lazy var oneLowercaseRule = AdjustableTextLabel()
    private lazy var oneUppercaseRule = AdjustableTextLabel()
    lazy var ruleTextLabelsArray = [eightCharactersRule, oneDightRule, oneLowercaseRule, oneUppercaseRule]
    
    func createTextFieldView(reuseIdentifier: String) {
        mainTextField = chooseTextField(reuseIdentifier: reuseIdentifier)
        addSubviews()
        title.text = AppConstants.subtitleNamesArray[mainTextField.tag]
        mainTextField.placeholder = AppConstants.textFieldPlaceholdersArray[mainTextField.tag]
        setTitleConstraints()
        setMainTextFieldConstraints()
        if mainTextField.tag == 1 {
            addInputLimitExtraViews()
        }
        if mainTextField.tag == 4 {
            setRuleTitles()
            addValidationRulesExtraViews()
            validationRulesTextFieldConfigure()
        }
    }
    
    private func addSubviews() {
        self.addSubview(mainTextField)
        self.addSubview(title)
    }
    
    private func chooseTextField(reuseIdentifier: String) -> AdjustableTextField {
        var textField = AdjustableTextField()
        switch reuseIdentifier {
            
        case NoDightsViewController.reuseIdentifier:
            textField.tag = 0
            
        case InputLimitViewController.reuseIdentifier:
            textField = InputLimitTextField()
            textField.tag = 1
            
        case OnlyCharactersViewController.reuseIdentifier:
            textField = OnlyCharTextField()
            textField.tag = 2
            
        case LinkViewController.reuseIdentifier:
            textField.tag = 3
            
        case ValidationRulesViewController.reuseIdentifier:
            textField.tag = 4
            
        default:
            break
        }
        return textField
    }
    
    private func addInputLimitExtraViews() {
        self.addSubview(countTextLabel)
        setCountTextLabelConstarints()
    }
    
    private func addValidationRulesExtraViews() {
        mainTextField.addSubview(strengthLevelView)
        addRuleTextLabelSubviews()
        setStrengthLevelViewConstraints()
        setRuleTitleConstraints()
    }
    
    private func validationRulesTextFieldConfigure() {
        mainTextField.clipsToBounds = true
        mainTextField.isSecureTextEntry = true
    }
    
    private func setRuleTitles() {
        for (index, label) in ruleTextLabelsArray.enumerated() {
            label.text = AppConstants.ruleTitlesArray[index]
        }
    }
    
    private func addRuleTextLabelSubviews() {
        ruleTextLabelsArray.forEach { self.addSubview($0) }
    }
    
    private func setMainTextFieldConstraints() {
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mainTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:
                                                                                Indents.left.rawValue),
                                     mainTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:
                                                                                Indents.right.rawValue),
                                     mainTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                                    ])
    }
    
    private func setTitleConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:
                                                                        Indents.left.rawValue),
                                     title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:
                                                                        Indents.right.rawValue),
                                     title.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     title.heightAnchor.constraint(equalToConstant: 50)
                                    ])
    }
    
    private func setCountTextLabelConstarints() {
        countTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([countTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                              constant: Indents.right.rawValue),
                                     countTextLabel.bottomAnchor.constraint(equalTo: mainTextField.topAnchor, constant: -7)])
    }
    
    private func setStrengthLevelViewConstraints() {
        strengthLevelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([strengthLevelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                     strengthLevelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right.rawValue),
                                     strengthLevelView.bottomAnchor.constraint(equalTo: mainTextField.bottomAnchor)])
    }
    
    private func setRuleTitleConstraints() {
        var topAnchor: CGFloat = 8
        ruleTextLabelsArray.forEach { ruleTitle in
            ruleTitle.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([ruleTitle.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: topAnchor),
                                         ruleTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                         ruleTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right.rawValue),
                                         ruleTitle.heightAnchor.constraint(equalToConstant: 20)])
            topAnchor += 20
        }
    }
}
