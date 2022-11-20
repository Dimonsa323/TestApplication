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
}

class RecepiesScreenPresenter {
    
    let menuActions = MenuActions.allCases
    private let navigator: NavigatorProtocol
    private let networking: NetwotkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetwotkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

extension RecepiesScreenPresenter: RecepiesScreenPresenterProtocol {
    func showNextVC(indexPath: IndexPath, view: UIViewController) {
        let menuFoodAction = menuActions[indexPath.item]
        
//        let presenter
//
//        switch menuFoodAction {
//
//        case .meat:
//            <#code#>
//        case .chicken:
//            <#code#>
//        case .fish:
//            <#code#>
//        case .greens:
//            <#code#>
//        }
    }
    
}
