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
    var isFavorite: Bool { get set }
    
    func saveIngredientsInCoreData()
    func checkIfElementInCD()
}

class IngredientsVCPresenter: IngredientsVCPresenterProtocol {

    var isFavorite: Bool = false
    var detailedRecipe: Recipe

    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    private let coreData: CoreDataStoreProtocol

    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, detailedRecipe: Recipe, coreData: CoreDataStoreProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.detailedRecipe = detailedRecipe
        self.coreData = coreData

        checkIfElementInCD()
    }

    func checkIfElementInCD() {
        isFavorite = coreData.fetchRequestIfConsistElement(with: detailedRecipe.label)
    }
    
    func saveIngredientsInCoreData() {
        guard !coreData.fetchRequestIfConsistElement(with: detailedRecipe.label) else {
            coreData.deleteRecipe(with: detailedRecipe.label)
            return
        }

        let recipeCD = FavoriteRecipeCD(context: coreData.context)
        recipeCD.label = detailedRecipe.label
        recipeCD.image = detailedRecipe.image
        recipeCD.totalTime = detailedRecipe.totalTime
        recipeCD.totalWeight = detailedRecipe.totalWeight
        recipeCD.calories = detailedRecipe.calories
        recipeCD.source = detailedRecipe.source
        recipeCD.url = detailedRecipe.url
        
        detailedRecipe.ingredients.forEach { ingredient in
            let dataBaseIngredient = IngredientCD(context: self.coreData.context)
            dataBaseIngredient.text = ingredient.text
            dataBaseIngredient.image = ingredient.image
            recipeCD.addToIngredients(dataBaseIngredient)
        }
        
        coreData.saveContext()
    }
}

