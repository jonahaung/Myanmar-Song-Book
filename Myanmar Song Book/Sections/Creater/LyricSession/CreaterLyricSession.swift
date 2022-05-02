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
            .importable()
            .toolbar {
                CreateLyricToolbar(clearButtonEnabled: !viewModel.song.rawText.isWhitespace, saveButtonEnabled: saveButtonEnabled) {
                    viewModel.song.rawText = String()
                } onSave: {
                    onSave()
                }
            }
    }
    
    private var saveButtonEnabled: Bool {
        !viewModel.song.title.isWhitespace && !viewModel.song.artist.isWhitespace && !viewModel.song.rawText.isWhitespace
    }
    
    private func onSave() {
        
    }
}
