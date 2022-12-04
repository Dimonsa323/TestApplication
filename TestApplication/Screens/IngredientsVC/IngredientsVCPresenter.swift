//
//  IngredientsVCPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 27.11.2022.
//

import Foundation
import UIKit


protocol IngredientsVCPresenterProtocol {
    var detailedRecipe: Recipe { get }
}

class IngredientsVCPresenter: IngredientsVCPresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    var detailedRecipe: Recipe
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, detailedRecipe: Recipe) {
        self.navigator = navigator
        self.networking = networking
        self.detailedRecipe = detailedRecipe
    }
}

