//
//  TabBarController.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit


class TabBarController: UITabBarController {

    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "mail"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let appViewController = AppViewController()
        let navigationController = UINavigationController(rootViewController: appViewController)
        let tabBarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "square.stack.3d.up"),
            tag: 1
        )
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers = [self.todayViewController, self.appViewController]
    }
    



}
