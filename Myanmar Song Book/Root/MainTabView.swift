//
//  MainTabView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 8/5/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeSession()
                .tabItem {
                    Label("Home", systemImage: XIcon.Icon.music_note_house.systemName)
                }
            SavedSongsView()
                .tabItem {
                    Label("Saved", systemImage: XIcon.Icon.heart_fill.systemName)
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: XIcon.Icon.tuningfork.systemName)
                }
        }
    }
}
