//
//  LoginView.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI

struct LoginView: View {

    @State private var login: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .shadow(radius: 12)
                    .padding(.top, 120)

                VStack(spacing: -0.5) {
                    TextField("Login", text: $login)
                        .modifier(TextFielder())
                        .modifier(TextModifier())
                    SecureField("Password", text: $password)
                        .modifier(TextFielder())
                        .modifier(TextModifier())
                }
                .cornerRadius(12)
                .padding(.top, 60)
                .padding(16)

                Button(action: {

                }) {
                    Text("Log in")
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .modifier(TextModifier())
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("AccentColor"))
                .cornerRadius(12)
                .padding(16)

                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
