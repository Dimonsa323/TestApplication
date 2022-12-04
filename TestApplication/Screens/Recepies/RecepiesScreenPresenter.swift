//
//  RecepiesScreenPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 11.11.2022.
//

import Foundation
import UIKit

protocol RecepiesScreenPresenterProtocol {
    var menuActions: [MenuActions] { get }
    func showNextVC(indexPath: IndexPath, view: UIViewController)
    var hits: [Hits] { get }
}

class RecepiesScreenPresenter {
    
    let hits: [Hits] = []
    let menuActions = MenuActions.allCases
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}


extension RecepiesScreenPresenter: RecepiesScreenPresenterProtocol {
    func showNextVC(indexPath: IndexPath, view: UIViewController) {
        let menuFoodAction = menuActions[indexPath.item]
        navigator.showDetailedVC(view: view, type: menuFoodAction)
    }
}

