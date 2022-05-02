//
//  HomeSessionNavItemsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct HomeSessionNavItemsView<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        content()
            .navigationTitle("Song Book")
            .navigationBarItems(leading: leadingItems, trailing: trailingItems)
    }
    private var leadingItems: some View {
        HStack {
            XIcon(.music_quarternote_3)
        }
    }
    private var trailingItems: some View {
        HStack {
            XIcon(.square_and_pencil)
                .tapToPresent(CreaterSessionView(), .FullScreen)
        }
    }
}
