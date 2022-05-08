//
//  SearchContentView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct RemoteSearchContentView: View {
    @EnvironmentObject private var viewModel: RemoteSearchViewModel
    @Environment(\.isSearching) private var isSearching
    var body: some View {
        if isSearching {
            List {
                ForEach(viewModel.results) { result in
                    SearchResultCell(result: result)
                }
            }
        }
    }
}
