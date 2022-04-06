//
//  SingleViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 10.02.2022.
//

import UIKit
import SafariServices

final class GroupMainViewController: UIViewController {
    static let reuseIdentifier = String(describing: GroupMainViewController.self)
    
    private lazy var noDightsModel = NoDightsModel()
    private lazy var inputLimitModel = InputLimitModel()
    private lazy var onlyCharModel = OnlyCharModel()
    private lazy var linkModel = LinkModel()
    private lazy var validationModel = ValidationModel()
    private lazy var timer = Timer()
    
    private var groupMainView: GroupMainView? {
        view as? GroupMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupMainView?.createSingleMainView()
        configure()
        setupHideKeyboardTapGesture()
    }
    
    private func configure() {
        setTextFieldsDelegate()
        addTextFieldsTarget()
    }
    
    private func setTextFieldsDelegate() {
        groupMainView?.textFieldsArray.forEach { $0.delegate = self  }
    }
    
    private func addTextFieldsTarget() {
        groupMainView?.textFieldsArray.forEach { $0.addTarget(self,
                                                               action: #selector(textFieldDidChanged),
                                                               for: .editingChanged)
        }
    }
    
    @objc private func textFieldDidChanged(sender: AdjustableTextField) {
        switch sender.tag {
        case 0:
            sender.text = noDightsModel.digitsExclusion(sender.text ?? "")
        case 1:
            groupMainView?.countTextLabel.text = inputLimitModel.characterCounter(sender.text ?? "")
            groupMainView?.inputLimitTextField.setColors()
        case 2:
            sender.text = sender.text?.uppercased()
            sender.text = onlyCharModel.maskApplication(sender.text ?? "")
        case 3:
            timer.invalidate()
            sender.text = sender.text?.lowercased()
            linkModel.checkStringIsLink(sender.text ?? "") ? openSafariVC(sender.text ?? "") : nil
        case 4:
            let result: (rulesArray: [Bool], strength: Int) = validationModel.checkPassword(sender.text ?? "")
            groupMainView?.strengthLevelView.setStrengthLevelViewColor(result.strength)
            setRuleTextLabelColor(result.rulesArray)
        default:
            break
        }
    }
    
    private func openSafariVC(_ string: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            if let url = URL(string: string) {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true)
            }
        }
    }
    
    private func setRuleTextLabelColor(_ rulesArray: [Bool]) {
        var index = 0
        rulesArray.forEach { rule in
            let textLabel = groupMainView?.ruleTextLabelsArray[index]
            switch rule {
            case true:
                textLabel?.isSatisfied = true
                textLabel?.text? = textLabel?.text?.replacingOccurrences(of: "-", with: "+") ?? ""
            case false:
                textLabel?.isSatisfied = false
                textLabel?.text? = textLabel?.text?.replacingOccurrences(of: "+", with: "-") ?? ""
            }
            index += 1
        }
    }
}
