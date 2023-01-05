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
    func showFavoriteVC() -> UINavigationController
    func fullRecipeVC(view: UIViewController, detailedType: Recipe)
    func showWebView(view: UIViewController, url: String)
    func showAnimationVC(view: UIViewController)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func startVC() -> UIViewController {
        let vc = assembler.createMainScreen(navigator: self)
        
        return vc
    }
    
    func showDetailedVC(view: UIViewController, type: MenuActions) {
        let vc = assembler.detailMenuRecipies(navigator: self, type: type)
        vc.hidesBottomBarWhenPushed = true
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
    
    func showFavoriteVC() -> UINavigationController {
        let vc = assembler.instantiateFavoriteVC(navigator: self)
        
        return vc
    }
    
    func fullRecipeVC(view: UIViewController, detailedType: Recipe) {
        let vc = assembler.goToFullRecipeVC(navigator: self, detailedRecipe: detailedType)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showWebView(view: UIViewController, url: String) {
        let vc = assembler.webViewRecipe(url: url)
        view.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAnimationVC(view: UIViewController) {
        let vc = assembler.animationView()
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
