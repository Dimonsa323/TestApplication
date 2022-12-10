//
//  FavoriteRecipe+CoreDataProperties.swift
//  TestApplication
//
//  Created by Дима Губеня on 10.12.2022.
//
//

import Foundation
import CoreData


extension FavoriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteRecipe> {
        return NSFetchRequest<FavoriteRecipe>(entityName: "FavoriteRecipe")
    }

    @NSManaged public var calories: Double
    @NSManaged public var image: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var label: String?
    @NSManaged public var source: String?
    @NSManaged public var totalTime: Double
    @NSManaged public var totalWeight: Double

}

extension FavoriteRecipe : Identifiable {

}
