//
//  MenuActions.swift
//  TestApplication
//
//  Created by Дима Губеня on 16.11.2022.
//

import Foundation
import UIKit

enum MenuActions: String, CaseIterable {
    case meat
    case chicken
    case fish
    case greens
    
    var title: String {
        switch self {
        case .meat:
            return "Meat"
        case .chicken:
            return "Chicken"
        case .fish:
            return "Fish"
        case .greens:
            return "Greens"
        }
    }
    
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
    
    var sectionImage: String {
        rawValue
    }
}

