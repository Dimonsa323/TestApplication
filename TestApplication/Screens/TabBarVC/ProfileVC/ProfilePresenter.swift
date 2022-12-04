//
//  ProfilePresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import Foundation
import UIKit

// MARK: - Protocol Presenter

protocol ProfilePresenterProtocol {
    
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
    
    
}


