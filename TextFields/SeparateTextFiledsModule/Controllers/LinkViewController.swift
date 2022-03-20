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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = textFieldMainView
        textFieldMainView.createTextFieldView(reuseIdentifier: Self.reuseIdentifier)
        setupHideKeyboardTapGesture()
        configureMainTextField()
    }
    
    private func configureMainTextField() {
        textFieldMainView.mainTextField.autocorrectionType = .no
        textFieldMainView.mainTextField.delegate = self
        textFieldMainView.mainTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ sender: AdjustableTextField) {
        timer.invalidate()
        sender.text = sender.text?.lowercased()
        linkModel.checkStringIsLink(sender.text ?? "") ? openSafariVC(sender.text ?? "") : nil
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
