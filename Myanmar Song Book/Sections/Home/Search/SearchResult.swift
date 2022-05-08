//
//  SearchResult.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 9/5/22.
//

import Foundation

struct SearchResult: Identifiable, Hashable {
    var id: String { text + property.rawValue }
    let text: String
    let property: Song.Property
}
