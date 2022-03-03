//
//  SingleMainView.swift
//  TextFields
//
//  Created by Artem Shcherban on 10.02.2022.
//

import UIKit

final class SingleMainView: UIView {
    
    private lazy var titleTextLabel: UILabel = {
        let tempTitleTextLabel = UILabel()
        tempTitleTextLabel.textColor = ColorConstants.graphiteColor
        tempTitleTextLabel.font = UIFont(name: FontConstants.rubikMedium.rawValue, size: 34)
        tempTitleTextLabel.textAlignment = .center
        tempTitleTextLabel.text = AppConstants.appTitleConstant
        return tempTitleTextLabel
    }()
    
    // Text Labels
    private lazy var noDightsTextLabel = AdjustableTextLabel()
    private lazy var inputLimitTextLabel = AdjustableTextLabel()
    private lazy var onlyCharTextLabel = AdjustableTextLabel()
    private lazy var linkTextLabel = AdjustableTextLabel()
    private lazy var validationTextLabel = AdjustableTextLabel()
    private lazy var textlabelsArray = [noDightsTextLabel, inputLimitTextLabel,
                                        onlyCharTextLabel, linkTextLabel, validationTextLabel]
    
    // Text Fields
    private lazy var noDightsTextField = AdjustableTextField()
    lazy var inputLimitTextField = InputLimitTextField()
    private lazy var onlyCharTextField = OnlyCharTextField()
    lazy var linkTextField = AdjustableTextField()
    private lazy var validationTextField = AdjustableTextField()
    lazy var textFieldsArray = [noDightsTextField, inputLimitTextField,
                                onlyCharTextField, linkTextField, validationTextField]
    
    // Count  Text Label
    lazy var countTextLabel = CountTextLabel()
    
    // Strength Level Views
    lazy var strengthLevelView = StrengthLevelView()
    
    // Rule Text Labels
    private lazy var eightCharactersRule = AdjustableTextLabel()
    private lazy var oneDightRule = AdjustableTextLabel()
    private lazy var oneLowercaseRule = AdjustableTextLabel()
    private lazy var oneUppercaseRule = AdjustableTextLabel()
    lazy var ruleTextLabelsArray = [eightCharactersRule, oneDightRule, oneLowercaseRule, oneUppercaseRule]
    
    func createSingleMainView() {
        addAllSubviews()
        setSubtitlesNames()
        setTextFieldTags()
        setTextFieldPlaceolders()
        setAllConstraints()
        linkTextFieldConfigure()
        validationTextFieldConfigure()
        setRuleTitles()
    }
    
    private func addAllSubviews() {
        self.addSubview(titleTextLabel)
        addSubtitleTextLabelSubviews()
        addTextFieldsSubviews()
        self.addSubview(countTextLabel)
        validationTextField.addSubview(strengthLevelView)
        addRuleTextLabelSubviews()
    }
    
    private func setAllConstraints() {
        setTitleTextLabelConstraints()
        setSubtitleTextLabelConstraints()
        setTextFieldsConstraints()
        setCountTextLabelConstarints()
        setStrengthLevelViewConstraints()
        setRuleTitleConstraints()
    }
    
    private func addSubtitleTextLabelSubviews() {
        textlabelsArray.forEach { self.addSubview($0) }
    }
    
    private func addTextFieldsSubviews() {
        textFieldsArray.forEach { self.addSubview($0) }
    }
    
    private func addRuleTextLabelSubviews() {
        ruleTextLabelsArray.forEach { self.addSubview($0) }
    }
    
    private func setSubtitlesNames() {
        var index = 0
        textlabelsArray.forEach { textLabel in
            textLabel.text = AppConstants.subtitleNamesArray[index]
            index += 1
        }
    }
    
    private func setTextFieldTags() {
        var index = 0
        textFieldsArray.forEach { textField in
            textField.tag = index
            index += 1
        }
    }
    
    private func setTextFieldPlaceolders() {
        var index = 0
        textFieldsArray.forEach { textField in
            textField.placeholder = AppConstants.textFieldPlaceholdersArray[index]
            index += 1
        }
    }
    
    private func linkTextFieldConfigure() {
        linkTextField.autocorrectionType = .no
    }
    
    private func validationTextFieldConfigure() {
        validationTextField.clipsToBounds = true
        validationTextField.isSecureTextEntry = true
    }
    
    private func setRuleTitles() {
        var index = 0
        ruleTextLabelsArray.forEach { ruleTitle in
            ruleTitle.text = AppConstants.ruleTitlesArray[index]
            index += 1
        }
    }
    
    private func setTitleTextLabelConstraints() {
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextLabel.heightAnchor.constraint(equalToConstant: 41),
                                     titleTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 92),
                                     titleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                             constant: Indents.left.rawValue),
                                     titleTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                              constant: Indents.right.rawValue)])
    }
    
    private func setSubtitleTextLabelConstraints() {
        var topAnchor: CGFloat = 163
        textlabelsArray.forEach { textLabel in
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topAnchor),
                                         textLabel.heightAnchor.constraint(equalToConstant: 20),
                                         textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                         textLabel.widthAnchor.constraint(equalToConstant: 100)])
            topAnchor += 90
        }
    }
    
    private func setTextFieldsConstraints() {
        var topAnchor: CGFloat = 187
        textFieldsArray.forEach { textField in
            textField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([textField.topAnchor.constraint(equalTo: self.topAnchor, constant: topAnchor),
                                         textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                         textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right.rawValue),
                                         textField.heightAnchor.constraint(equalToConstant: 36)])
            topAnchor += 90
        }
    }
    
    private func setCountTextLabelConstarints() {
        countTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([countTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                              constant: Indents.right.rawValue),
                                     countTextLabel.bottomAnchor.constraint(equalTo: inputLimitTextLabel.bottomAnchor)])
    }
    
    private func setStrengthLevelViewConstraints() {
        strengthLevelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([strengthLevelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                     strengthLevelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right.rawValue),
                                     strengthLevelView.bottomAnchor.constraint(equalTo: validationTextField.bottomAnchor, constant: 0)])
    }
    
    private func setRuleTitleConstraints() {
        var topAnchor: CGFloat = 8
        ruleTextLabelsArray.forEach { ruleTitle in
            ruleTitle.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([ruleTitle.topAnchor.constraint(equalTo: validationTextField.bottomAnchor, constant: topAnchor),
                                         ruleTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left.rawValue),
                                         ruleTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right.rawValue),
                                         ruleTitle.heightAnchor.constraint(equalToConstant: 20)])
            topAnchor += 20
        }
    }
}
