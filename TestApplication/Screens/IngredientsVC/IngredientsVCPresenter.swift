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
    
    func saveUserInDataBase(recipe: Recipe, closure: @escaping () -> ())
    func fetchRequest(closure: @escaping () -> ())
}

class IngredientsVCPresenter: IngredientsVCPresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    private let coreData: CoreDataStoreProtocol
    var detailedRecipe: Recipe
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, detailedRecipe: Recipe, coreData: CoreDataStoreProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.detailedRecipe = detailedRecipe
        self.coreData = coreData
    }
    
    func saveUserInDataBase(recipe: Recipe, closure: @escaping () -> ()) {
        let recipeDataBase = FavoriteRecipe(context: coreData.context)
        
        recipeDataBase.image = recipe.image
        recipeDataBase.label = recipe.label
        recipeDataBase.source = recipe.source
        recipeDataBase.source = recipe.source
        
        coreData.saveContext()
        closure()
    }
    
    func fetchRequest(closure: @escaping () -> ()) {
        detailedRecipe = coreData.fetchRequest()
        
        closure()
    }
}

