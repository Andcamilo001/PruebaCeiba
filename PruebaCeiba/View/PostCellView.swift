//
//  PostCellView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

struct PostCellView: View {
    
    let post: PostViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(post.title)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 43/255, green: 94/255, blue: 50/255, opacity: 1.0))
                .multilineTextAlignment(.center)
            Text("\(post.body)")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color(.black))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.horizontal, 6)
        .background(.white)
        .shadow(color: .gray, radius: 3, x: 0.0, y: 0.0)
        
    }
}

