//
//  UserListView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct UserListView: View {
    
    let results: [UserListViewModel]
    
    var body: some View {
        List(results) { result in
         
            NavigationLink(destination: PostListScreen(users: result)){
                UserCellView(usersL: result)
            }
          
        }.listStyle(.plain)
    }
}

/*struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}*/
