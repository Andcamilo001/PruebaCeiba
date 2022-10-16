//
//  Constans.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import Foundation


struct Constans {
    
    struct urls {
        static let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        static func postsByUserId(_ userId: Int) -> URL {
            return URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)")!
        }
    }
    
}
