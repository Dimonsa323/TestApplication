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
    private lazy var favoriteScreen: UINavigationController = navigator.showFavoriteVC()
    private lazy var profileScreen: UINavigationController = instantiateProfileVC()
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    private let isFavorite: Bool = false
    
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
        TabBarAppearance.shared.setAppearance()
        setupVCs()
    }
}

    // MARK: - Private Extension

private extension FlowController {
    
    // MARK: - Method

    func setupVCs() {
        tabBarVC.navigationController?.setViewControllers([recepiesScreen, favoriteScreen, profileScreen], animated: true)
    }
    
    func instantiateRecepiesVC() -> UINavigationController {
        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
        let vc = RecepiesScreen(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Recipies", image: UIImage(named: "bookWhite"), selectedImage: UIImage(named: "bookPurple")
        )
        return navigator
    }
    
    func instantiateProfileVC() -> UINavigationController {
        let presenter = ProfilePresenter(navigator: navigator)
        let vc = ProfileVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(named: "Profile 1"), selectedImage: UIImage(named: "profilePurple")
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
