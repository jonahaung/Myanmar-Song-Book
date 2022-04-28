//
//  SearchableView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI
struct SearchableView<Content: View>: View {
    
    let content: () -> Content
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        content()
            .overlay(
                SearchContentView()
                    .environmentObject(viewModel))
            .searchable(text: $viewModel.searchText)
    }
}
