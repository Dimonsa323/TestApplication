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
    func deleteRecipe(id: UUID)
    func fetchRequestIfConsistElement(with label: String) -> Bool
    func deleteRecipe(with label: String)
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

    func fetchRequestIfConsistElement(with label: String) -> Bool {
        
        let fetchRequest: NSFetchRequest<FavoriteRecipeCD> = FavoriteRecipeCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "label == %@", label as CVarArg)
        fetchRequest.fetchLimit = 1

        do {
            let count = try context.fetch(fetchRequest).count

            return count > 0
        } catch let error {
            print(error)
        }

        return false
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

    func deleteRecipe(with label: String) {
        let fetchRequest: NSFetchRequest<FavoriteRecipeCD> = FavoriteRecipeCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "label == %@", label as CVarArg)

        let context = persistentContainer.viewContext

        do {
            let recipes = try context.fetch(fetchRequest)
            for recipe in recipes {
                context.delete(recipe)
                print("DELETE -----------------------------")
            }
            saveContext()
            print("Delete")
        } catch let error {
            print(error)
        }
    }

    func deleteRecipe(id: UUID) {
        let fetchRequest: NSFetchRequest<FavoriteRecipeCD> = FavoriteRecipeCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        let context = persistentContainer.viewContext

        do {
            let recipes = try context.fetch(fetchRequest)
            for recipe in recipes {
                context.delete(recipe)
                print("DELETE -----------------------------")
            }
            saveContext()
            print("Delete")
        } catch let error {
            print(error)
        }
    }
}
