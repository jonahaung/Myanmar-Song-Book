//
//  PickerNavigationView.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 25/3/22.
//

import SwiftUI

struct PickerNavigationView<Content: View>: View {
    
    var showCancelButton = true
    let content: () -> Content
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            content()
                .navigationBarItems(leading: Leading())
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
    
    private func Leading() -> some View {
        Group {
            if showCancelButton {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}
