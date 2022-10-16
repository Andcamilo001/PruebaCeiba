//
//  UserCellView.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI



struct UserCellView: View {
    
    let usersL: UserListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(usersL.name)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 43/255, green: 94/255, blue: 50/255, opacity: 1.0))
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(Color(red: 43/255, green: 94/255, blue: 50/255, opacity: 1.0))
                Text("\(usersL.phone)")
            }
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color(red: 43/255, green: 94/255, blue: 50/255, opacity: 1.0))
                Text("\(usersL.email)")
            }
            
                Text("VER PUBLICACIONES")
                    .font(.footnote)
                    .padding()
                    .padding(.leading, 90)
                    .foregroundColor(Color(red: 43/255, green: 94/255, blue: 50/255, opacity: 1.0))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.horizontal, 6)
        .background(.white)
        .shadow(color: .gray, radius: 3, x: 0.0, y: 0.0)
    }
}

/*struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}*/
