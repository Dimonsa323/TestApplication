//
//  MenuActions.swift
//  TestApplication
//
//  Created by Дима Губеня on 16.11.2022.
//

import Foundation
import UIKit

enum MenuActions: String, CaseIterable {
    case meat = "Meat"
    case chicken = "Chicken"
    case fish = "Fish"
    case greens = "Greens"
    
    var partURL: String {
        switch self {
        case .meat:
            return "meat"
        case .fish:
            return "fish"
        case .chicken:
            return "chicken"
        case .greens:
            return "greens"
        }
    }
        
        var imageView: UIImage? {
            UIImage(named: self.rawValue)
        }
    }

