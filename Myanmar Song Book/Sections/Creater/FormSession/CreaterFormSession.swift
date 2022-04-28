//
//  CreaterSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct CreaterFormSession: View {

    var body: some View {
        CreateSessionNavItemsView {
            CreaterForm()
        }
        .authenticatable()
    }
}
