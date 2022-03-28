//
//  LinkViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit
import SafariServices

final class LinkViewController: UIViewController {
    static let reuseIdentifier = String(describing: LinkViewController.self)
    
    private lazy var textFieldMainView = TextFieldMainView()
    private lazy var linkModel = LinkModel()
    private lazy var timer = Timer()
    
    override func loadView() {
        view = textFieldMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldMainView.createTextFieldView(reuseIdentifier: Self.reuseIdentifier)
        setupHideKeyboardTapGesture()
        configureMainTextField()
    }
    
    private func configureMainTextField() {
        textFieldMainView.mainTextField.autocorrectionType = .no
        textFieldMainView.mainTextField.delegate = self
    }
    
    private func openSafariVC(_ string: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            if let url = URL(string: string) {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true)
            }
        }
    }
}

extension LinkViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        timer.invalidate()
        textField.text = textField.text?.lowercased()
        linkModel.checkStringIsLink(string) ? openSafariVC(string) : nil
        return true
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        linkModel.checkStringIsLink(textField.text ?? "") ? openSafariVC(textField.text ?? "") : nil
        textField.resignFirstResponder()
        return true
    }
}
