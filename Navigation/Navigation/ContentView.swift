//
//  ContentView.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var isLogin = false

    var body: some View {
        TabView() {
            if isLogin {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill.checkmark")
                    }
            } else {
                LoginView(logged: $isLogin)
                    .tabItem {
                        Label("Login", systemImage: "person")
                    }
            }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "menucard")
                }
            InfoView()
                .tabItem {
                    Label("Anthropology", systemImage: "globe")
                }
        }
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
