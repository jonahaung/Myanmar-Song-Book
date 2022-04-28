//
//  CreaterFormViewModel.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import Foundation

final class CreaterViewModel: ObservableObject {
    
    weak var textView: CreaterTextView?
    
    @Published var song = Song(rawText: withChords)
    @Published var isValidated = false
    
    func task() {
        textView?.insert(text: song.rawText)
    }
}
