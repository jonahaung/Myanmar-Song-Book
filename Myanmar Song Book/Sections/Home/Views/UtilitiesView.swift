//
//  UtilitiesView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 9/5/22.
//

import SwiftUI

struct UtilitiesView: View {
    
    struct Constants {
        static let cellSize: CGFloat = 60
    }
    enum Utility: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        case Tuner, Metronome, ChordLibrary
        
        var xIcon: XIcon.Icon {
            switch self {
            case .Tuner:
                return .tuningfork
            case .Metronome:
                return .metronome
            case .ChordLibrary:
                return .music_quarternote_3
            }
        }
        
        var colr: Color {
            switch self {
            case .Tuner:
                return .purple
            case .Metronome:
                return .teal
            case .ChordLibrary:
                return .blue
            }
        }
    }
    
    var body: some View {
        HStack {
            ForEach(Utility.allCases) { item in
                UtilityCell(item: item)
                    .tapToPresent(view(for: item))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    private func view(for item: Utility) -> some View {
        VStack {
            Image(systemName: item.xIcon.systemName)
                .resizable()
                .scaledToFit()
                .foregroundColor(XColor.UI.random())
        }
        .navigationTitle(item.rawValue)
        .embeddedInNavigationView(showCancelButton: true)
    }
}


struct UtilityCell: View {

    let item: UtilitiesView.Utility
    
    var body: some View {
        VStack {
            Image(systemName: item.xIcon.systemName)
                .resizable()
                .frame(width: UtilitiesView.Constants.cellSize, height: UtilitiesView.Constants.cellSize)
                .scaledToFit()
                .foregroundColor(item.colr)
        }
        .frame(maxWidth: .infinity)
    }
}
