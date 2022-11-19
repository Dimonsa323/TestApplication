//
//  MainScreenPresenter.swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol MainScreenPresenterProtocol {
    func showNextScreen(view: UIViewController)
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
    func showNextScreen(view: UIViewController) {
//        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
//        let vc = RecepiesScreen(presenter: presenter)
       // view.navigationController?.pushViewController(vc, animated: true)
        navigator.showRecepiesVC(networking: networking, view: view, navigator: navigator)
    }
    
}
