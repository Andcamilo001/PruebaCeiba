//
//  UserListView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var oO = SearchObervableObject()
    @State private var searchText = ""
    
    let results: [UserListViewModel]
    
    var body: some View {
        
        List(searchText.isEmpty ? results: oO.searchResults) { result in
            
            UserCellView(usersL: result)
        }
        .listStyle(.plain)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText) { searchText in
            oO.searchResults = results.filter( { result in
                result.name.lowercased().contains(searchText.lowercased())
            })
        }
        
    }
    
    
}
