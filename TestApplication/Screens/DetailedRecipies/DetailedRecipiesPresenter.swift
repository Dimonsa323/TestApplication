//
//  DetailedRecipiesPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import Foundation
import UIKit

protocol DetailedRecipiesPresenterProtocol {
    var recipesFood: [Hits] { get }
    func showDetailedVC(indexPath: IndexPath, view: UIViewController)
    func getInfo(closure: @escaping () -> Void)
    var type: MenuActions { get }
}

class DetailedRecipiesPresenter {
    let navigator: NavigatorProtocol
    let networking: NetworkingServiceProtocol
    var type: MenuActions
    var recipesFood: [Hits] = []
    
    //MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, type: MenuActions) {
        self.navigator = navigator
        self.networking = networking
        self.type = type
    }
}

extension DetailedRecipiesPresenter: DetailedRecipiesPresenterProtocol {
    func showDetailedVC(indexPath: IndexPath, view: UIViewController) {
        let recipe = recipesFood[indexPath.row].recipe
        navigator.showIngredientsVC(view: view, detailedType: recipe)
    }
    
    func getInfo(closure: @escaping () -> Void) {
        networking.getModel(type: type) { hit in
            self.recipesFood = hit
            closure()
        }
    }
}
