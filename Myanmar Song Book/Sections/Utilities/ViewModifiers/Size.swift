//
//  Frame.swift
//  UltimateChords
//
//  Created by Aung Ko Min on 9/4/22.
//

import SwiftUI

public struct SizeModifier: ViewModifier {
    let size: CGSize
    public func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

public extension View {
    func size(_ size: CGSize) -> some View {
        ModifiedContent(content: self, modifier: SizeModifier(size: size))
    }
}
