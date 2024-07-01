//
//  ColorSelectorView.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

struct ColorSelectorView: View {
    
    let colors: [Color]
    @Binding var color: Color
    
    // TODO: make change with Assets Colors for color scheme
    @Environment(\.colorScheme) var colorScheme
    func getSelectionColor(for color: Color) -> Color {
        let accent: Color = colorScheme == .dark ? .white : .black
        return color == self.color ? accent : Color.gray.opacity(0.5)
    }
    
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    self.color = color
                }) {
                    Circle()
                        .fill(color)
                        .frame(width: 24, height: 24)
                        .overlay(
                            Circle()
                                .stroke(getSelectionColor(for: color), lineWidth: 1)
                        )
                }
            }
        }
    }
}

#Preview {
    
    let colors: [Color] = [.red, .green, .blue]
    HStack(spacing: 40) {
        ColorSelectorView(colors: colors, color: .constant(Color.red))
        ColorSelectorView(colors: colors, color: .constant(Color.green))
        ColorSelectorView(colors: colors, color: .constant(Color.blue))
    }
}
