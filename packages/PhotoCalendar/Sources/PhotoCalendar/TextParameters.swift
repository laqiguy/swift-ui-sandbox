//
//  TextParametersViewModel.swift
//  
//
//  Created by Aleksei Tiurnin on 28.06.2024.
//

import SwiftUI

extension Color {
    static var redMadColor: Color = .init(red: 234.0/255, green: 51.0/255, blue: 35.0/255)
}

final public class TextParameters: ObservableObject {
    var textColors: [Color] = [.white, .black, .redMadColor]
    @Published var mainTextColor: Color = .white
    @Published var dayoffTextColor: Color = .white
    @Published var shadowColor: Color = .black
    
    @Published var family: String = "CoFo Redmadrobot"
    @Published var font: String = "CoFo Redmadrobot"
    
    @Published var scale: Double = 1.0
    let fontScales: ClosedRange<Double> = ClosedRange<Double>(uncheckedBounds: (lower: 0.70, upper: 1.30))
    let fontScaleStep: Double = 0.15
    
    public init() {}
}
