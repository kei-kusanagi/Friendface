//
//  UserView.swift
//  Friendface
//
//  Created by Juan Carlos Robledo Morales on 23/10/24.
//

import SwiftUI

struct UserView: View {
    let user: User

    var body: some View {
        List {
            Section("Acerca de") {
                Text(user.about)
                    .padding(.vertical)
            }

            Section("Detalles de contacto") {
                Text("Dirección: \(user.address)")
                Text("Empresa: \(user.company)")
            }

            Section("Amigos") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    UserView(user: .example)
}
