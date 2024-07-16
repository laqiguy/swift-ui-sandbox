//
//  TextParametersEditorView.swift
//
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

public struct TextParametersEditorView: View {
    @EnvironmentObject var textParameters: TextParameters
    
    @Binding var isBlurred: Bool
            
    public init(isBlurred: Binding<Bool>) {
        self._isBlurred = isBlurred
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Toggle("Блюр", isOn: $isBlurred)
                .frame(height: 24)
            HStack {
                ColorSelectorView(colors: textParameters.textColors, color: $textParameters.mainTextColor)
                ColorSelectorView(colors: textParameters.textColors, color: $textParameters.dayoffTextColor)
                Picker("Выбери шрифт", selection: $textParameters.family) {
                    ForEach(textParameters.families, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.wheel)
            }
            Slider(
                value: $textParameters.scale,
                in: textParameters.fontScales,
                step: textParameters.fontScaleStep) {
                    Text("Размер шрифта")
                }
            if textParameters.fonts.count > 1 {
                Picker("", selection: $textParameters.font) {
                    ForEach(
                        textParameters.fonts,
                        id: \.self)
                    { name in
                        Text(name).font(.custom(name, size: 14 * textParameters.scale))
                    }
                }
            } else {
                Spacer(minLength: 34)
            }
        }
        .onChange(of: textParameters.mainTextColor) { newValue in
            textParameters.shadowColor = newValue == .black ? .white : .black
        }
        .padding()
        .presentationDetents([.fraction(0.3)])
    }
}

#Preview {
    TextParametersEditorView(isBlurred: .constant(false))
        .environmentObject(TextParameters())
}
