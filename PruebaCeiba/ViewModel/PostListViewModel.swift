//
//  PostListViewModel.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import Foundation

@MainActor
class PostListViewModel: ObservableObject {
    
    @Published var postsR: [PostViewModel] = [PostViewModel]()
    
    func postsPublicByUser(userId: Int) async {
        
        do{
            
            let posts = try await Webservice().get(url: Constans.urls.postsByUserId(userId)) { data in
                return try? JSONDecoder().decode([Posts].self, from: data)
            }
            self.postsR = posts.map(PostViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
}

struct PostViewModel {
    
    private let post: Posts
    
    init(_ post: Posts){
        self.post = post
    }
    
    var userId: Int {
        post.userId
    }
    
    var id: Int {
        post.id
    }
    var title: String {
        post.title
    }
    var body: String {
        post.body
    }
}
