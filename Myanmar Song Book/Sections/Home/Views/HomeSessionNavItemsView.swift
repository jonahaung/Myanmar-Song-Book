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
        HStack(spacing: 0) {
            XIcon(.music_quarternote_3)
                .imageScale(.large)
                .foregroundStyle(.secondary)
        }
    }
    private var trailingItems: some View {
        HStack {
            Image(systemName: XIcon.Icon.square_and_pencil.systemName)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(XColor.UI.random())
                .tapToPresent(CreaterSessionView(), .fullScreen)
        }
    }
}
