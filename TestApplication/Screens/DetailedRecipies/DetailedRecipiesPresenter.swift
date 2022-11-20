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
    func showDetailedVC(indexPath: IndexPath)
    func getInfo()
}

class DetailedRecipiesPresenter {
    let navigator: NavigatorProtocol
    let networking: NetworkingService
    let type: MenuActions
    var recipesFood: [Hits] = []
    
    //MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingService, type: MenuActions) {
        self.navigator = navigator
        self.networking = networking
        self.type = type
    }
}

extension DetailedRecipiesPresenter: DetailedRecipiesPresenterProtocol {
    func showDetailedVC(indexPath: IndexPath) {
        
    }
    
    func getInfo() {
        networking.getModel(type: type) { hit in
            self.recipesFood = hit
        }
    }
}
