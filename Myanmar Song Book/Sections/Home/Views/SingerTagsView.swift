//
//  SingerTagsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct SingerTagsView: View {
    var body: some View {
        AutoWrap(Singers.allSingers, id: \.self, vSpacing: 5, hSpacing: 5) { singer in
            Tag(singer, bgcolor: XColor.Tag.random())
                .font(.system(size: 12, weight: .medium, design: .serif))
        }
    }
}
