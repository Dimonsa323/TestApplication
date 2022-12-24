//
//  EnumImage.swift
//  TestApplication
//
//  Created by Дима Губеня on 24.12.2022.
//

import Foundation
import UIKit

enum MenuImage: String, CaseIterable {
    case activeHeart
    case tapHeart
    
    var title: String {
        switch self {
        case .activeHeart:
            return "Vector"
        case .tapHeart:
            return "VectorPurple"
        }
    }
}
