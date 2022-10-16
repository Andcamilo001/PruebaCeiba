//
//  PostListView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct PostListView: View {
    
    let posts: [PostViewModel]
    
    var body: some View {
        List(posts, id: \.id) { post in
            PostCellView(post: post)
        }
    }
}


