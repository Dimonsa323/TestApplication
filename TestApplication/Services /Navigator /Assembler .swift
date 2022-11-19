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
    
    func createMainScreen(navigator: NavigatorProtocol, networking: NetwotkingServiceProtocol) -> UIViewController {
        
        let presenter = MainScreenPresenter(navigator: navigator, networking: networking)
        let vc = MainScreen(presenter: presenter)
        
        return vc
    }
    
    func openRecepiesScreen(navigator: NavigatorProtocol, networking: NetwotkingServiceProtocol) -> UIViewController {
        
        let presenter = RecepiesScreenPresenter(navigator: navigator, networking: networking)
        let vc = RecepiesScreen(presenter: presenter)
        
        return vc 
    }
}
