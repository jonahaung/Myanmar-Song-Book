//
//  CreateSessionNavItemsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct CreateSessionNavItemsView<Content: View>: View {
    
    let content: () -> Content
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: CreaterViewModel
    
    var body: some View {
        content()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Create Song")
            .navigationBarItems(leading: CancelButton(dismiss: _dismiss), trailing: trailingItems)
            .sheet(isPresented: $viewModel.showForm) {
                DispatchQueue.main.async {
                    viewModel.validate()
                }
            } content: {
                CreaterForm()
            }
            .onAppear {
                viewModel.validate()
            }
    }
    
    private var trailingItems: some View {
        XIcon(.music_note)
            .tapToPresent(CreaterForm())
    }
}

