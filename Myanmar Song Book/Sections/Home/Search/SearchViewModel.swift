//
//  SearchViewModel.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 22/3/22.
//

import SwiftUI
import Combine
final class SearchViewModel: ObservableObject {
    
    @Published var results = [YSong]()
    @Published var searchText = String()
    
    private var subscription: Set<AnyCancellable> = []
    init() {
        $searchText
            .debounce(for: .milliseconds(100), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .compactMap{$0}
            .sink(receiveValue: { [weak self] text in
                self?.searchItems(string: text)
            })
            .store(in: &subscription)
    }
    
    private func searchItems(string: String) {
        withAnimation {
            
        }
    }
}
