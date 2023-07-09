//
//  InfoDetails.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI

struct InfoDetails: View {

    var post: Post

    var body: some View {
        ScrollView {
            post.image
                .resizable()
                .scaledToFit()
                .padding(.top, 12)
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(post.subtitle)
                    .modifier(HeaderModifier())

                Divider()

                Text(post.description)
                    .modifier(TextModifier())
            }
            .padding()
        }
        .navigationTitle(post.title)
        .background(Color(.systemGray6))
    }
}

struct InfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetails(post: data[0])
    }
}
