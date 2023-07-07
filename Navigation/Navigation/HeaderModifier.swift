//
//  HeaderModifier.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI

struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.indigo)
    }
}
