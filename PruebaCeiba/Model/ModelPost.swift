//
//  Post.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import Foundation


struct Posts: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
