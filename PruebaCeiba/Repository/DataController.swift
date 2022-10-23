//
//  DataController.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 17/10/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    let persistentData: NSPersistentContainer
    
    static let shared = DataController()
    
    private init() {
        persistentData = NSPersistentContainer(name: "UserModel")
        persistentData.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentData.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
           return persistentData.newBackgroundContext()
    }
   
    
    func save() throws {
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    
    func importData() async throws {
        
        func removeAllData() {
            
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UsersDTO")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            
            do {
                try viewContext.execute(deleteRequest)
            } catch {
                print(error)
            }
        }
        
        let usersDTOs = try await Webservice().get(url: Constans.urls.usersURL) { data in
            return try? JSONDecoder().decode([Users].self, from: data)
            
        }
        
        removeAllData()
        
        for users in usersDTOs {
            
            try await backgroundContext.perform {
                let usersDTO = UsersDTO(context: self.viewContext)
                usersDTO.id = Int64(users.id)
                usersDTO.name = users.name
                usersDTO.phone = users.phone
                usersDTO.email = users.email
                try self.save()               
                
            }
            
            
        }
    }
}
