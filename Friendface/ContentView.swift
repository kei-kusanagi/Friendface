//
//  ContentView.swift
//  Friendface
//
//  Created by Juan Carlos Robledo Morales on 23/10/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]


    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)

                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friendface")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
        }
        .task {
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        // No volver a descargar datos si ya los tenemos
        guard users.isEmpty else { return }

        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let downloadedUsers = try decoder.decode([User].self, from: data)
            
            let insertContext = ModelContext(modelContext.container)

            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
        } catch {
            print("La descarga falló")
        }
    }

}

#Preview {
    ContentView()
}
