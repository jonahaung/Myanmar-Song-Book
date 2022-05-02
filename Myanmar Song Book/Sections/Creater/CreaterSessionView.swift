//
//  CreaterSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct CreaterSessionView: View {

    var body: some View {
        CreateNavigationView {
            CreateSessionNavItemsView {
                CreaterLyricSession()
            }
        }
        .authenticatable()
    }
}
