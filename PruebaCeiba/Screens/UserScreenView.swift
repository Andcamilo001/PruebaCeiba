//
//  UserScreenView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct UserScreenView: View {
    
    
    
    
    @StateObject var uvm: UserViewModel = UserViewModel()
    
    
    
    var body: some View {
        
        
        
        ZStack {
            
            if uvm.isLoading {
                ProgressView()
            } else {
                
                NavigationView{
                    
                    
                    UserListView(results: uvm.usersInfos)
                        .task {
                            await uvm.getUsers()
                        }
                        .navigationTitle("Prueba de Ingreso")
                }
            }
            
        }
    }
}


struct UserScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UserScreenView()
    }
}


