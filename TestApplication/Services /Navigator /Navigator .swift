//
//  Navigator .swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func startVC() -> UIViewController
    func showDetailedVC(view: UIViewController, type: MenuActions)
    func showTabBar(view: UIViewController)
    func showIngredientsVC(view: UIViewController, detailedType: Recipe)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func startVC() -> UIViewController {
        let vc = assembler.createMainScreen(navigator: self)
        
        return vc
    }
    
    func showDetailedVC(view: UIViewController, type: MenuActions) {
        let vc = assembler.detailMenuRecipies(navigator: self, type: type)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showTabBar(view: UIViewController) {
        let vc = assembler.showFlowController(navigator: self)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        view.navigationController?.present(vc, animated: true)
    }
    
    func showIngredientsVC(view: UIViewController, detailedType: Recipe) {
        let vc = assembler.showIngredients(navigator: self, detailedRecipe: detailedType)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
