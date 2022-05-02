//
//  FormCell.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 25/4/22.
//

import SwiftUI

struct FormCell<Content: View>: View {
    
    let icon: XIcon.Icon
    var color = XColor.UI.cyan
    let content: () -> Content
    
    var body: some View {
        HStack {
            XIcon(icon)
                .foregroundColor(color)
                .frame(width: 25, height: 25)
            content()
        }
    }
}
