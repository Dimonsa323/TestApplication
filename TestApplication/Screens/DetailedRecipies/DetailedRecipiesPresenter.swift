//
//  DetailedRecipiesPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 19.11.2022.
//

import Foundation
import UIKit

protocol DetailedRecipiesPresenterProtocol {
    var recipes: [Hits] { get }
}

class DetailedRecipiesPresenter {
    let navigator: NavigatorProtocol
    let networking: NetworkingService
    let type: MenuActions
    var recipes: [Hits] = []
    
    //MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingService, type: MenuActions) {
        self.navigator = navigator
        self.networking = networking
        self.type = type
    }
}

extension DetailedRecipiesPresenter: DetailedRecipiesPresenterProtocol {
    
}
