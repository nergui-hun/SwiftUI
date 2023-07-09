//
//  LoginView.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var logged: Bool

    @State private var login: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow,
                                                        .green, .blue, .purple, .red]),
                            center: .center, angle: Angle(radians: 1))
            .ignoresSafeArea(edges: .top)

            VStack {
                Image("img2")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(80)
                    .shadow(radius: 12)
                    .padding(.top, 20)

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
                    self.logged = true
                }) {
                    Text("Log in")
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .modifier(TextModifier())
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color(.systemMint))
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
