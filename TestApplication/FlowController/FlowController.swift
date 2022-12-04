//
//  FlowController.swift
//  TestApplication
//
//  Created by Дима Губеня on 13.11.2022.
//

import UIKit

    // MARK: - Class FlowController

final class FlowController: UIViewController, UITabBarControllerDelegate {
    
    // MARK: - Properties
    
    private let tabBarVC: UITabBarController = UITabBarController()
    private lazy var recepiesScreen: UINavigationController = instantiateRecepiesVC()
    private lazy var favoriteScreen: UINavigationController = instantiateFavoriteVC()
    private lazy var profileScreen: UINavigationController = instantiateProfileVC()
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setUIAppearanceCustomNavBar(type: .opaque)
    }
}

    // MARK: - Private Extension

private extension FlowController {
    
    // MARK: - Method
    
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
        let presenter = FavoritePresenter(navigator: navigator, networking: networking)
        let vc = FavoriteVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Favorite", image: UIImage(named: "Heart 2"), selectedImage: UIImage(named: "Heart 2")
        )
        return navigator
    }
    
    func instantiateProfileVC() -> UINavigationController {
        let presenter = ProfilePresenter(navigator: navigator, networking: networking)
        let vc = ProfileVC(presenter: presenter)
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
