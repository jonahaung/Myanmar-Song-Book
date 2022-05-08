//
//  SearchViewModel.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 22/3/22.
//

import SwiftUI
import Combine
final class RemoteSearchViewModel: ObservableObject {
    
    @Published var results = [SearchResult]()
    
    @Published var searchText = String()
    
    private var subscription: Set<AnyCancellable> = []
    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] text in
                self?.searchItems(string: text)
            })
            .store(in: &subscription)
    }
    
    private func searchItems(string: String) {
        
        var results = [SearchResult]()
        YSong.search(text: string).map(Song.init).forEach { song in
            if song.title.contains(string) {
                let item = SearchResult(text: song.title, property: .Song)
                results.append(item)
            }
            if song.artist.contains(string) {
                let item = SearchResult(text: song.artist, property: .Artist)
                results.append(item)
            }
            if song.composer.contains(string) {
                let item = SearchResult(text: song.composer, property: .Composer)
                results.append(item)
            }
            if song.album.contains(string) {
                let item = SearchResult(text: song.album, property: .Album)
                results.append(item)
            }
        }
        self.results = Array(Set(results))
        
    }
   
}
