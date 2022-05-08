//
//  HomeSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct HomeSession: View {
    var body: some View {
        HomeSessionNavItemsView {
            XScrollView {
                RemoteSearchableView {
                    VStack(spacing: 0) {
                        XSectionView {
                            SingerTagsView()
                        }
                        XSectionView {
                            GenreTagsView()
                        }
                        XSectionView {
                            IconTagsView()
                        }
                    }
                }
                
            }
            
        }
        .embeddedInNavigationView()
    }
    
    private var bottomBar: some View {
        HStack {
            Text("Saved")
                .tapToPush(SavedSongsView())
            Spacer()
            Text("Settings")
                .tapToPush(SettingsView())
        }.padding(.horizontal)
    }
}
