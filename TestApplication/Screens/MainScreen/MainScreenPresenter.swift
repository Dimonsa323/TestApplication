//
//  MainScreenPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol MainScreenPresenterProtocol {
    func showTabBarVC(view: UIViewController)
}

class MainScreenPresenter {
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
    func showTabBarVC(view: UIViewController) {
        navigator.showTabBar(view: view)
    }
}
