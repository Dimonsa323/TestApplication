//
//  ModelMenu.swift
//  TestApplication
//
//  Created by Дима Губеня on 10.11.2022.
//

import Foundation

struct FoodMenu: Decodable {
    let hits: [Hits]
}

struct Hits: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let label: String
    let image: String
    let source: String
    let url: String?
    let calories: Double
    let totalWeight: Double
    let ingredients: [Ingredients]
    let totalTime: Double
    
    init(label: String, image: String, source: String, calories: Double,
         totalWeight: Double, totalTime: Double, ingredients: Ingredients) {
        self.label = label
        self.image = image
        self.source = source
        self.calories = calories
        self.totalWeight = totalWeight
        self.totalTime = totalTime
        self.ingredients = Ingredients
    }
    
    init(favoriteRecipe: FavoriteRecipe) {
        self.label = favoriteRecipe.label ?? ""
        self.image = favoriteRecipe.image ?? ""
        self.source = favoriteRecipe.source ?? ""
        self.calories = favoriteRecipe.calories
        self.totalWeight = favoriteRecipe.totalWeight
        self.totalTime = favoriteRecipe.totalTime
        self.ingredients = favoriteRecipe.ingredients
    }
} 

struct Ingredients: Decodable {
    let text: String
    let image: String?
}


