//
//  InitialViewController.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

class InitialViewController: UIViewController {
    
    private var initialMainView: InitialMainView? {
        
        view as? InitialMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMainView?.createInitialMainView()
        addButtonTarget()
    }
    
    func addButtonTarget() {
        initialMainView?.buttonsArray.forEach({ $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside) })
    }
    
    @objc func buttonPressed(sender: ControllerButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController
        
        if sender.tag == 1 {
            viewController = storyboard.instantiateViewController(withIdentifier: GroupMainViewController.reuseIdentifier)
        } else {
            viewController = MultipleViewsController()
            //            viewController = storyboard.instantiateViewController(withIdentifier: MultipleViewsController.reuseIdentifier)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
