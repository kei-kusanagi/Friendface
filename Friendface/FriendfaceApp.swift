//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Juan Carlos Robledo Morales on 23/10/24.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
