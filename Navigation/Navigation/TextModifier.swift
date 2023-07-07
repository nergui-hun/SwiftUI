//
//  TextModifier.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
                .font(.body)
                .fontWeight(.regular)
    }
}
