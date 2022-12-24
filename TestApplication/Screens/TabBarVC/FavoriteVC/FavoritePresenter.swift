//
//  FavoritePresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import Foundation
import UIKit

protocol FavoritePresenterProtocol {
    var modelRecipe: [Hits] { get }
    func getInfo(closure: () -> Void)
}

class FavoritePresenter: FavoritePresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    private let cordata: CoreDataStore
    var modelRecipe: [Hits] = []
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol, cordata: CoreDataStore) {
        self.navigator = navigator
        self.networking = networking
        self.cordata = cordata
    }
    
    func getInfo(closure: () -> Void) {
        cordata.fetchRequest{ recipies in
            let likedRecipies = recipies.map(Recipe.init(recipe:))
            let hits = likedRecipies.map { Hits(recipe: $0)}
            self.modelRecipe = hits
            closure()
        }
    }
}


