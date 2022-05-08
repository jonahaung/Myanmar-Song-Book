//
//  SearchCell.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 9/5/22.
//

import SwiftUI

struct SearchCell: View {
    let song: Song
    var body: some View {
        VStack(alignment: .leading) {
            Text(song.title)
                .font(XFont.headline(for: song.title).font)
                .foregroundColor(.primary)
            HStack {
                XIcon(.music_note)
                    .foregroundColor(.accentColor)
                Text(song.artist)
                    .foregroundColor(.secondary)
                    .font(XFont.universal(for: .footnote).font)
            }
        }
        .tapToPresent(ViewerSessionView(song: song).embeddedInNavigationView(showCancelButton: true), .fullScreen)
    }
}

