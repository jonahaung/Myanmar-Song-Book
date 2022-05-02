//
//  CreateLyricToolbar.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 2/5/22.
//

import SwiftUI

struct CreateLyricToolbar: ToolbarContent {
    
    let clearButtonEnabled: Bool
    let saveButtonEnabled: Bool
    var onClear: () -> Void
    var onSave: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Button("Clear") {
                onClear()
            }
            .disabled(!clearButtonEnabled)
            Spacer()
            Button("Save") {
                onSave()
            }
            .disabled(!saveButtonEnabled)
        }
    }
}
