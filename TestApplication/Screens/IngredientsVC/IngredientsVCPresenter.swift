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
    
    func saveIngredientsInCoreData()
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
    
    func saveIngredientsInCoreData() {
        let recipeCD = FavoriteRecipeCD(context: coreData.context)
        recipeCD.label = detailedRecipe.label
        recipeCD.image = detailedRecipe.image
        recipeCD.totalTime = detailedRecipe.totalTime
        recipeCD.totalWeight = detailedRecipe.totalWeight
        recipeCD.calories = detailedRecipe.calories
        recipeCD.source = detailedRecipe.source
        
        detailedRecipe.ingredients.forEach { ingredient in
            let dataBaseIngredient = IngredientCD(context: self.coreData.context)
            dataBaseIngredient.text = ingredient.text
            dataBaseIngredient.image = ingredient.image
            recipeCD.addToIngredients(dataBaseIngredient)
        }
        
        coreData.saveContext()
    }
}
