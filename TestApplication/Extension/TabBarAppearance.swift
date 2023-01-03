//
//  TabBarAppearance.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.01.2023.
//

import Foundation
import UIKit

struct TabBarAppearance {
    
    static var shared = TabBarAppearance()
    
    func setAppearance() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .buttonColor
    }
}
