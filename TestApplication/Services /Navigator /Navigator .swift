//
//  Navigator .swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func startVC(networking: NetwotkingServiceProtocol) -> UIViewController
    func showRecepiesVC(networking: NetwotkingServiceProtocol, view: UIViewController, navigator: NavigatorProtocol)
}

class Navigator {
    
    private let assembler = Assembler()
    
    func startVC(networking: NetwotkingServiceProtocol) -> UIViewController {
        let vc = assembler.createMainScreen(navigator: self, networking: networking)
        
        return vc
    }
    
    func showRecepiesVC(networking: NetwotkingServiceProtocol, view: UIViewController, navigator: NavigatorProtocol)  {
        let vc = assembler.openRecepiesScreen(navigator: self, networking: networking)
        view.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension Navigator: NavigatorProtocol {
   
}
