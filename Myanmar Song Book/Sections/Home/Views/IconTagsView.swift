//
//  IconTagsView.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct IconTagsView: View {
    var body: some View {
        AutoWrap(XIcon.Icon.allCases, id: \.self, vSpacing: 10, hSpacing: 10) { icon in
            XIcon(icon)
                .font(.system(size: 30))
        }
    }
}
