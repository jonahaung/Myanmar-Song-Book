//
//  LyricsTableViewCell.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 22/3/22.
//

import SwiftUI

struct ExplorerCell: View {
    
    let song: Song
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(song.title)
                .font(XFont.headline(for: song.title).font)
                .foregroundColor(.primary)
            HStack {
                XIcon(.music_note)
                Text(song.artist)
                    .foregroundColor(.secondary)
                    .font(XFont.universal(for: .footnote).font)
                Spacer()
            }
        }
        .tapToPresent(ViewerSessionView(song: song), .fullScreen)
    }
}
