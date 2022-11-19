//
//  FlowController.swift
//  TestApplication
//
//  Created by Дима Губеня on 13.11.2022.
//

import UIKit


final class FlowController: UIViewController, UITabBarControllerDelegate {
    
    private let tabBarVC: UITabBarController = UITabBarController()
    
    private lazy var recepiesScreen: UINavigationController = instantiateRecepiesVC()
    
    private let navigator: NavigatorProtocol
    private let networking: NetwotkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetwotkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

private extension FlowController {
    
    func instantiateRecepiesVC() -> UINavigationController {
        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
        let vc = RecepiesScreen(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Recipies", image: UIImage(systemName: "cookbook"), selectedImage: UIImage(systemName: "cookbook")
        )
        return navigator
    }
    
    func initialSetup() {
        view.backgroundColor = .brown
        tabBarVC.delegate = self
        tabBarVC.viewControllers = [recepiesScreen]
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.tintColor = .black
        tabBarVC.tabBar.unselectedItemTintColor = .green
        addChild(tabBarVC, toContainer: view)
    }
}
