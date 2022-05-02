//
//  CreaterFormViewModel.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import Foundation
import Combine

final class CreaterViewModel: ObservableObject {
    
    weak var textView: CreaterTextView?

    @Published var song = Song()
    @Published var showForm = false
    
    init() {
        setupSubscriptions()
    }
    
    func validate() {
        showForm = song.hasNotFilledForm
    }
    
    private var subscriptions = Set<AnyCancellable>()
    private func setupSubscriptions() {
        $song
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .compactMap{$0}
            .sink { [weak self] song in
                self?.textView?.set(string: song.rawText)
            }
            .store(in: &subscriptions)
    }
}

final class SongBuilder: ObservableObject {
    
    @Published var title = String()
    @Published var artist = String()
    @Published var rawText = String()
    
    @Published var composer = String()
    @Published var album = String()
    @Published var key = String()
    @Published var tempo = String()
    @Published var genre = String()
    @Published var mediaLink = String()
    @Published var created = Date()
    @Published var createrID = String()
    @Published var year = String()
    
    var hasNotFilledForm: Bool { title.isWhitespace || artist.isWhitespace }
    var canSave: Bool { !hasNotFilledForm && !rawText.isWhitespace }
    
    func set(song: Song) {
        title = song.title
        artist = song.artist
        rawText = song.rawText
    }
}
