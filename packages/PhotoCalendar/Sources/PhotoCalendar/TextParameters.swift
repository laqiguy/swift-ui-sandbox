//
//  TextParametersViewModel.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import os
import SwiftUI

extension Color {
    static let redMadColor: Color = .init(red: 234.0/255, green: 51.0/255, blue: 35.0/255)
}

public final class TextParameters: ObservableObject {
    var textColors: [Color] = [.white, .black, .redMadColor]
    @Published var mainTextColor: Color = .white {
        didSet {
            shadowColor = mainTextColor == .black ? .white : .black
        }
    }
    @Published var dayoffTextColor: Color = .redMadColor
    @Published var shadowColor: Color = .black
    
    @Published var family: String = "CoFo Redmadrobot" {
        didSet {
            font = fonts[0]
        }
    }
    var families: [String] {
        return UIFont.familyNames
    }
    
    @Published var font: String = "CoFo Redmadrobot"
    var fonts: [String] {
        UIFont.fontNames(forFamilyName: family)
    }
    
    @Published var scale: Double = 1.0
    let fontScales: ClosedRange<Double> = ClosedRange<Double>(uncheckedBounds: (lower: 0.70, upper: 1.30))
    let fontScaleStep: Double = 0.15
    
    public init() {
        do {
            try registerFont(named: "CoFoRedmadrobot-Regular", fileExtension: "otf")
            try registerFont(named: "CoFoSans-Regular", fileExtension: "ttf")
        } catch {
            Logger().error("\(error)")
        }
    }
}
