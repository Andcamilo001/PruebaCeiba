//
//  DataController.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 17/10/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "UserModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Fail to loaded data...\(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data Saved!!!")
        } catch {
            print("Couldnt save a data")
        }
    }
    
    func addUser(id: Int64 ,name: String, phone: String, email: String, context: NSManagedObjectContext) {
        let user = User(context: context)
        user.id = id
        user.name = name
        user.phone = phone
        user.email = email
        
        save(context: context)
    }
}
