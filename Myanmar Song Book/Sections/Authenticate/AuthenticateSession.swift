//
//  AuthenticateSession.swift
//  Myanmar Song Book
//
//  Created by Aung Ko Min on 27/4/22.
//

import SwiftUI

struct AuthenticateSession: View {
    
    @StateObject  private var authenticator = Authenticator()
    var body: some View {
        Form {
            Text("Login with Email")
        }
        .navigationTitle("Log in")
    }
}
