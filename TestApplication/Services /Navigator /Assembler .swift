//
//  Assembler .swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

class Assembler {
    
    private let networking = NetworkingService()
    private let dataBase = CoreDataStore()
    
    func createMainScreen(navigator: NavigatorProtocol) -> UIViewController {
        
        let presenter = MainScreenPresenter(navigator: navigator, networking: networking)
        let vc = MainScreen(presenter: presenter)
        
        return vc
    }
    
    func detailMenuRecipies(navigator: NavigatorProtocol, type: MenuActions) -> UIViewController {
        
        let presenter = DetailedRecipiesPresenter(navigator: navigator, networking: networking, type: type)
        let vc = DeteiledRecipiesScreen(presenter: presenter)
        
        return vc
    }
    
    func showFlowController(navigator: NavigatorProtocol) -> UIViewController {
        
        let vc = FlowController(navigator: navigator, networking: networking)
        
        return vc
    }
    
    func showIngredients(navigator: NavigatorProtocol, detailedRecipe: Recipe) -> UIViewController {
        let presenter = IngredientsVCPresenter(navigator: navigator, networking: networking, detailedRecipe: detailedRecipe, coreData: dataBase)
        let vc = IngredientsVC(presenter: presenter)
        
        return vc
    }
    
    func instantiateFavoriteVC(navigator: NavigatorProtocol) -> UINavigationController {
        let presenter = FavoritePresenter(navigator: navigator, networking: networking, coredata: dataBase)
        let vc = FavoriteVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Favorite", image: UIImage(named: "Heart 2"), selectedImage: UIImage(named: "Heart 2")
        )
        return navigator
    }
}
