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
    private lazy var favoriteScreen: UINavigationController = instantiateFavoriteVC()
    private lazy var profileScreen: UINavigationController = instantiateProfileVC()
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
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
            title: "Recipies", image: UIImage(named: "book"), selectedImage: UIImage(named: "book")
        )
        return navigator
    }
    
    func instantiateFavoriteVC() -> UINavigationController {
        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
        let vc = RecepiesScreen(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Favorite", image: UIImage(named: "Heart 2"), selectedImage: UIImage(named: "Heart 2")
        )
        return navigator
    }
    
    func instantiateProfileVC() -> UINavigationController {
        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
        let vc = RecepiesScreen(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(named: "Profile 1"), selectedImage: UIImage(named: "Profile 1")
        )
        return navigator
    }
    
    func initialSetup() {
        view.backgroundColor = .black
        tabBarVC.delegate = self
        tabBarVC.viewControllers = [recepiesScreen, favoriteScreen, profileScreen]
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.unselectedItemTintColor = .white
        addChild(tabBarVC, toContainer: view)
    }
}
