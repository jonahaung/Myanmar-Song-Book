//
//  ExplorerView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 9/5/22.
//

import SwiftUI

struct ExplorerView: View {
    
    let item: SearchResult
    
    var body: some View {
        VStack {
            Text(item.property.rawValue)
        }
        .navigationTitle(item.text)
    }
}
