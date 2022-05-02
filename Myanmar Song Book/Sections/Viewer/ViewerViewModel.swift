//
//  ViewerViewModel.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 28/4/22.
//

import Foundation

final class ViewerViewModel: ObservableObject {
    
    @Published var song: Song
    
    init(_ song: Song) {
        self.song = song
    }
}
