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
} 

struct Ingredients: Decodable {
    let text: String
    let image: String?
}


