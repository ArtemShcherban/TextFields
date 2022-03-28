//
//  InitialMainView.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class InitialMainView: UIView {
    
    lazy var singleViewButton = ControllerButton()
    lazy var multipleViewsButton = ControllerButton()
    
    weak var delegate: InitialMainViewDelegate?
    
    func createInitialMainView() {
        backgroundColor = .white
        addSubviews()
        setButtonTitles()
        addButtonTarget()
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
    
    func addButtonTarget() {
        singleViewButton.addTarget(delegate, action: #selector(delegate?.singleViewButtonTapped), for: .touchUpInside)
        multipleViewsButton.addTarget(delegate, action: #selector(delegate?.multipleViewsButtonTapped), for: .touchUpInside)
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

@objc protocol InitialMainViewDelegate: AnyObject {
    
    func singleViewButtonTapped()
    func multipleViewsButtonTapped()
    
}
