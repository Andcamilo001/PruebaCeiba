//
//  SearchTableView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct SearchTableView: View {
    
    @State var searchUser = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.black)
            
            TextField("Search User", text: $searchUser)
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(.white.opacity(0.6))
        .cornerRadius(10)
    }
}

struct customSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTableView()
    }
}
