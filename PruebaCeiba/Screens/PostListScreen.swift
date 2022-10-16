//
//  PostListScreen.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct PostListScreen: View {
    
    let users: UserListViewModel
    @StateObject private var postListVM = PostListViewModel()
    
    var body: some View {
        PostListView(posts: postListVM.postsR)
            .task {
                await postListVM.postsPublicByUser(userId: users.id)
            }
    }
}

struct PostListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let postListVM = UserListViewModel(Users(id: 0, name: "Camilo", phone: "5555-555", email: "Camilo.com"))
        
        UserScreenView()
        
    }
}
