//
//  UserViewModel.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    
    @Published var usersInfos: [UserListViewModel] = []
    @Published private(set) var isLoading = false
    
    func getUsers() async {
        
        isLoading = true
        
        do{
           let usersList = try await Webservice().get(url: Constans.urls.usersURL) { data in
                return try? JSONDecoder().decode([Users].self, from: data)
               	
            }
           
            self.usersInfos = usersList.map(UserListViewModel.init)
            
            
            
            
        } catch {
            print(error)
            
        }
        
        self.isLoading = false
    }
    
    
    
}

struct UserListViewModel: Identifiable {
    
    //let id = UUID()
    
    private let users: Users
    
    init(_ users: Users) {
    self.users = users
    
}
    
    var id: Int {
        users.id
    }
    
    var name: String {
        users.name
    }
    
    var phone: String {
        users.phone
    }
    
    var email: String {
        users.email
    }
}
