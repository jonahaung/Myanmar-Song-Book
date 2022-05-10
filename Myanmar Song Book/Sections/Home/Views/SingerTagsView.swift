//
//  SingerTagsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI
import WaterfallGrid

struct SingerTagsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            WaterfallGrid(Singers.allSingers) { singer in
                VStack {
                    Text(singer)
                        .font(.subheadline)
                        .fixedSize()
                        .foregroundColor(.primary)
                        .padding(.horizontal, 8)
                }
                .frame(maxHeight: .infinity)
                .background(XColor.Light.random())
                .cornerRadius(8)
                .tapToPush(ExplorerView(QueryFilter(text: singer, property: .Artist)))
            }
            .frame(minHeight: 170)
            .gridStyle(columns: 6, spacing: 3, animation: .interactiveSpring())
            .scrollOptions(direction: .horizontal)
        }
        
    }
}
