//
//  CancelButton.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 2/5/22.
//

import SwiftUI

struct CancelButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Cancel")
            .tapToShowComfirmationDialog(dialog: .init(message: "Are you sure you want to quit?", items: [.init(title: "Discard and Quit", role: .destructive, action: quitAction)]))
    }
    
    private func quitAction() {
        dismiss()
    }
}
