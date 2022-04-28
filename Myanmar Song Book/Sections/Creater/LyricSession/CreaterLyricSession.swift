//
//  CreaterLyricSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct CreaterLyricSession: View {
    
    @EnvironmentObject private var viewModel: CreaterViewModel
    
    var body: some View {
        CreaterTextView.SwiftUIView()
            .environmentObject(viewModel)
            .task {
                viewModel.task()
            }
    }
}
