//
//  MainScreenPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

    // MARK: - MainScreenPresenterProtocol

protocol MainScreenPresenterProtocol {
    func showTabBarVC(view: UIViewController)
}

    // MARK: - Class MainScreenPresenter

class MainScreenPresenter {
    
    // MARK: - Properties
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

    // MARK: - Private Extension

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
    func showTabBarVC(view: UIViewController) {
        navigator.showTabBar(view: view)
    }
}
