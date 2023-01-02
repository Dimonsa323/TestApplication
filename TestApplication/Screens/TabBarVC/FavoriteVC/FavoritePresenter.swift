//
//  FavoritePresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import Foundation
import UIKit

protocol FavoritePresenterProtocol {
    var modelRecipe: [Recipe] { get set }
    func getInfo(closure: () -> Void)
    func deleteUserInDataBase(indexPath: IndexPath, closure: () -> Void)
    func pushFullRecipe(indexPath: IndexPath, view: UIViewController)
}

class FavoritePresenter: FavoritePresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    private let coredata: CoreDataStore
    var modelRecipe: [Recipe] = []
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, coredata: CoreDataStore) {
        self.navigator = navigator
        self.networking = networking
        self.coredata = coredata
    }
    
    func getInfo(closure: () -> Void) {
        coredata.fetchRequest{ recipies in
            let likedRecipies = recipies.map(Recipe.init(recipe:))
            self.modelRecipe = likedRecipies
            closure()
        }
    }
    
    func deleteUserInDataBase(indexPath: IndexPath, closure: () -> Void) {
        coredata.deleteRecipe(id: modelRecipe[indexPath.row].recipeID ?? UUID())
        modelRecipe.remove(at: indexPath.row)
        
        closure()
    }
    
    func pushFullRecipe(indexPath: IndexPath, view: UIViewController) {
        let fullIngredients = modelRecipe[indexPath.row]
        navigator.fullRecipeVC(view: view, detailedType: fullIngredients)
    }
}
