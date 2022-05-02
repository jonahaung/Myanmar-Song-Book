//
//  SearchContentView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct SearchContentView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    @Environment(\.isSearching) private var isSearching
    var body: some View {
        if isSearching {
            List {
                Section {
                    ForEach(viewModel.results) {
                        Text($0.text.str)
                    }
                }
                Section {
                    ForEach(0..<10) { _ in
                        Text(Date().description)
                    }
                }
            }
            
        }
    }
}
