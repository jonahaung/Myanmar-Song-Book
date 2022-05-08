//
//  Myanmar_Song_BookApp.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

@main
struct Myanmar_Song_BookApp: App {
    
    let persistance = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistance.context)
        }
    }
}
