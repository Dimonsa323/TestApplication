//
//  MainScreenPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol MainScreenPresenterProtocol {
    
}

class MainScreenPresenter {
    private let navigator: NavigatorProtocol
    private let networking: NetwotkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetwotkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func showNextScreen() {
        
    }
    
}
