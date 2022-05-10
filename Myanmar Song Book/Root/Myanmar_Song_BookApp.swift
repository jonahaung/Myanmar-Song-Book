//
//  Myanmar_Song_BookApp.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

@main
struct Myanmar_Song_BookApp: App {
    
    private let persistance = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegateAdaptor.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistance.context)
        }
    }
}
