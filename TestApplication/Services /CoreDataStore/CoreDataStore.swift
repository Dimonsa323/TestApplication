//
//  CoreDataStore.swift
//  TestApplication
//
//  Created by Дима Губеня on 07.12.2022.
//

import Foundation
import CoreData

// MARK: - CoreDataStoreProtocol

protocol CoreDataStoreProtocol {
    var context: NSManagedObjectContext { get }
    
    func saveContext ()
    func fetchRequest(closure: (([FavoriteRecipeCD]) -> Void))
}

// MARK: - Core Data stack

class CoreDataStore: CoreDataStoreProtocol {
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TestApplication")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Success ------------------>")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
//
    func fetchRequest(closure: (([FavoriteRecipeCD]) -> Void)) {
        let fetchRequest: NSFetchRequest<FavoriteRecipeCD> = FavoriteRecipeCD.fetchRequest()

        do {
            let objects = try context.fetch(fetchRequest)
            
            closure(objects)
        } catch let error {
            print(error)
        }
    }
}
