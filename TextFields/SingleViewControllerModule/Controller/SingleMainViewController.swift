//
//  SingleViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 10.02.2022.
//

import UIKit
import SafariServices

final class SingleMainViewController: UIViewController {
    
    private var noDightsModel: NoDightsModel!
    private var inputLimitModel: InputLimitModel!
    private var onlyCharModel: OnlyCharModel!
    private var linkModel: LinkModel!
    private var validationModel: ValidationModel!
    private var timer: Timer?
    
    private var singleMainView: SingleMainView? {
        
        view as? SingleMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleMainView?.createSingleMainView()
        noDightsModel = NoDightsModel()
        inputLimitModel = InputLimitModel()
        onlyCharModel = OnlyCharModel()
        linkModel = LinkModel()
        validationModel = ValidationModel()
        configure()
        setupHideKeyboardTapGesture()
    }
    
    private func configure() {
        setTextFildsDelegate()
        addTextFildsTarget()
    }
    
    private func setTextFildsDelegate() {
        singleMainView?.textFieldsArray.forEach { $0.delegate = self  }
    }
    
    private func addTextFildsTarget() {
        singleMainView?.textFieldsArray.forEach { $0.addTarget(self,
                                                               action: #selector(textFieldDidChanged),
                                                               for: .editingChanged)
        }
    }
    
    @objc func textFieldDidChanged(sender: AdjustableTextField) {
        switch sender.tag {
        case 0:
            sender.text = noDightsModel.digitsExclusion(sender.text ?? "")
        case 1:
            singleMainView?.countTextLabel.text = inputLimitModel.characterCounter(sender.text ?? "")
            singleMainView?.inputLimitTextField.setColors()
            singleMainView?.countTextLabel.setTextColor()
        case 2:
            sender.text = sender.text?.uppercased()
            sender.text = onlyCharModel.maskApplication(sender.text ?? "")
        case 3:
            timer?.invalidate()
            sender.text = sender.text?.lowercased()
            linkModel.checkStringIsLink(sender.text ?? "") ? openSafariVC(sender.text ?? "") : nil
        case 4:
            let result: (rulesArray: [Bool], strength: Int) = validationModel.checkPassword(sender.text ?? "")
            singleMainView?.strengthLevelView.setStrengthLevelViewColor(result.strength)
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
            let textLabel = singleMainView?.ruleTextLabelsArray[index]
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

extension SingleMainViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textField = textField as? AdjustableTextField {
            textField.isActive = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let textField = textField as? AdjustableTextField {
            textField.isActive = false
        }
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return true
//    }
}

private extension SingleMainViewController {
    
    func setupHideKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
