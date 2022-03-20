//
//  MultipleViewsController.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class MultipleViewsController: UITabBarController {
    static let reuseIdentifier = String(describing: MultipleViewsController.self)
    
    private lazy var viewController1 = UINavigationController.init(rootViewController: NoDightsViewController())
    private lazy var viewController2 = UINavigationController.init(rootViewController: InputLimitViewController())
    private lazy var viewController3 = UINavigationController.init(rootViewController: OnlyCharactersViewController())
    private lazy var viewController4 = UINavigationController.init(rootViewController: LinkViewController())
    private lazy var viewController5 = UINavigationController.init(rootViewController: ValidationRulesViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        tabBarConfigure()
        setTabBarTitle()
        setTabBarShadow()
    }
    
    private func tabBarConfigure() {
        self.setViewControllers([viewController1, viewController2,
                                 viewController3, viewController4,
                                 viewController5], animated: false)
        self.tabBar.backgroundColor = ColorConstants.dirtyWhiteColor
        self.tabBar.unselectedItemTintColor = ColorConstants.graphiteColor
    }
    
    private func setTabBarTitle() {
        guard let items = self.tabBar.items else { return }
        var index = 0
        for item in items {
            item.title = AppConstants.subtitleNamesArray[index]
            index += 1
        }
    }
    
    private func setTabBarShadow() {
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0.7)
        self.tabBar.layer.shadowRadius = 2
        self.tabBar.layer.shadowOpacity = 0.3
    }
}
