//
//  ContentView.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView() {
            FeedView()
                .tabItem {
                    Label("Feed",
                    systemImage: "house")
                }
                LoginView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            PlayerView()
                .tabItem {
                    Label("Player", systemImage: "music.note")
                }
            VideoView()
                .tabItem {
                    Label("Video", systemImage: "play.rectangle")
                }
            RecorderView()
                .tabItem {
                    Label("Recorder", systemImage: "mic")
                }
        }
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
