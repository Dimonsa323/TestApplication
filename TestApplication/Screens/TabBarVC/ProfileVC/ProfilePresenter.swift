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
    func showAnimationView(view: UIViewController)
    
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    private let navigator: NavigatorProtocol
   
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

extension ProfilePresenter {
    
    func showAnimationView(view: UIViewController) {
        navigator.showAnimationVC(view: view)
    }
}


