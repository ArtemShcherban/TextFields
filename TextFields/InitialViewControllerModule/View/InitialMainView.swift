//
//  InitialMainView.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class InitialMainView: UIView {
    
    private lazy var singleViewButton = ControllerButton()
    private lazy var multipleViewsButton = ControllerButton()
    lazy var buttonsArray = [singleViewButton, multipleViewsButton]
    
    func createInitialMainView() {
        addSubviews()
        setButtonTitles()
        setButtonTags()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(singleViewButton)
        addSubview(multipleViewsButton)
    }
    
    private func setButtonTitles() {
        singleViewButton.setTitle(AppConstants.singleViewButtonTitle, for: .normal)
        multipleViewsButton.setTitle(AppConstants.multipleViewsButtonTitle, for: .normal)
    }
    
    private func setButtonTags() {
        singleViewButton.tag = 1
        multipleViewsButton.tag = 2
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([singleViewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:
                                                                                Indents.left.rawValue),
                                     singleViewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:
                                                                                    Indents.right.rawValue),
                                     singleViewButton.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -10)])
        
        NSLayoutConstraint.activate([multipleViewsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:
                                                                                    Indents.left.rawValue),
                                     multipleViewsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:
                                                                                    Indents.right.rawValue),
                                     multipleViewsButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)])
    }
}
