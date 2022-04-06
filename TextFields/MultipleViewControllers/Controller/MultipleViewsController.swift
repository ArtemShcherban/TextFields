//
//  MultipleViewsController.swift
//  TextFields
//
//  Created by Artem Shcherban on 09.03.2022.
//

import UIKit

final class MultipleViewsController: UITabBarController {
    static let reuseIdentifier = String(describing: MultipleViewsController.self)
    
    private lazy var noDightsViewController = UINavigationController.init(rootViewController: NoDightsViewController())
    private lazy var inputLimitViewController = UINavigationController.init(rootViewController: InputLimitViewController())
    private lazy var onlyCharactersViewController = UINavigationController.init(rootViewController:
                                                                                    OnlyCharactersViewController())
    private lazy var linkViewController = UINavigationController.init(rootViewController: LinkViewController())
    private lazy var validationRulesViewController = UINavigationController.init(rootViewController:
                                                                                    ValidationRulesViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        tabBarConfigure()
        setTabBarTitle()
        setTabBarShadow()
    }
    
    private func tabBarConfigure() {
        self.setViewControllers([noDightsViewController,
                                 inputLimitViewController,
                                 onlyCharactersViewController,
                                 linkViewController,
                                 validationRulesViewController], animated: false)
        self.tabBar.backgroundColor = ColorConstants.tabBarColor
        self.tabBar.unselectedItemTintColor = ColorConstants.graphiteColor
        self.tabBar.accessibilityIdentifier = "MultipleViewsTabBar"
    }
    
    private func setTabBarTitle() {
        guard let items = self.tabBar.items else { return }
        var index = 0
        for item in items {
            item.title = AppConstants.subtitleNamesArray[index]
            item.accessibilityIdentifier = String(index)
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
