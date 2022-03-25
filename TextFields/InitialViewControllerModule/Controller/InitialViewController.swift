//
//  InitialViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class InitialViewController: UIViewController, InitialMainViewDelegate {
    
    private lazy var initialMainView: InitialMainView? = {
        let view = InitialMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = initialMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMainView?.createInitialMainView()
        addButtonTarget()
    }
    
    func addButtonTarget() {
        initialMainView?.singleViewButton.addTarget(self, action: #selector(singleViewButtonTapped), for: .touchUpInside)
        initialMainView?.multipleViewsButton.addTarget(self, action: #selector(multipleViewsButtonTapped), for: .touchUpInside)
    }
    
    @objc func singleViewButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = UIViewController()
        viewController = storyboard.instantiateViewController(withIdentifier: GroupMainViewController.reuseIdentifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func multipleViewsButtonTapped() {
        var viewController = UIViewController()
        viewController = MultipleViewsController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
