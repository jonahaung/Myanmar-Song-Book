//
//  AuthenticationChecker.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI
private struct AuthenticationCheckerModifier: ViewModifier {
    @State private var isUnAuthenticated = false
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isUnAuthenticated) {
                AuthenticateSession()
            }
    }
}
extension View {
    func authenticatable() -> some View {
        ModifiedContent(content: self, modifier: AuthenticationCheckerModifier())
    }
}
