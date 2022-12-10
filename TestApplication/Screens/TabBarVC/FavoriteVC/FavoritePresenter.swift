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
    
}

class FavoritePresenter: FavoritePresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    var modelRecipe: [Hits] = [] 
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
    
    func getInfo(closure: @escaping () -> Void) {
        
        }
    }


