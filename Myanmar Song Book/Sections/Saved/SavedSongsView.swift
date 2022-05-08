//
//  SavedSongsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 8/5/22.
//

import SwiftUI
import CoreData

struct SavedSongsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \YSong.lastViewed, ascending: true)],animation: .default)
    private var songs: FetchedResults<YSong>
    var allSong: AllSong { .init(Array(songs).map(Song.init))}
    
    var body: some View {
        SavedSearchableView {
            List {
                ForEach(allSong.artists) { artist in
                    DisclosureGroup {
                        ForEach(artist.albums) { album in
                            if album.name.isWhitespace {
                                ForEach(album.songs) {
                                    SongListCell(song: $0)
                                        .foregroundStyle(.secondary)
                                }
    //                            .onDelete { offsets in
    //                                offsets.map { album.songs[$0] }.forEach(viewContext.delete)
    //                            }
                            }else {
                                DisclosureGroup {
                                    ForEach(album.songs) {
                                        SongListCell(song: $0)
                                            .foregroundStyle(.secondary)
                                    }
    //                                .onDelete { offsets in
    //                                    offsets.map { album.songs[$0] }.forEach(viewContext.delete)
    //                                }
                                } label: {
                                    Text(album.name)
                                        .foregroundColor(.accentColor)
                                        .font(XFont.body(for: album.name).font)
                                }
                            }
                        }
                    } label: {
                        Text(artist.name)
                            .font(XFont.headline(for: artist.name).font)
                    }

                }
            }
            .navigationTitle("Saved Items")
        }
        .embeddedInNavigationView()
    }
    

}

struct SongsGroup: Identifiable {
    var id: String { key }
    
    
    let key: String
    let songs: [YSong]
}
