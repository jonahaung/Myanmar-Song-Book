//
//  CreaterNavView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 2/5/22.
//

import SwiftUI

struct CreateNavigationView<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        NavigationView {
            content()
        }
        .navigationViewStyle(.stack)
        .environmentObject(CreaterViewModel())
    }
}
