//
//  WeekNumberView.swift
//  MyCalendar
//
//  Created by Aleksei Tiurnin on 27.03.2023.
//

import SwiftUI

struct WeekNumberView: View {
    
    var data: String
    @EnvironmentObject var textParameters: TextParameters

    var body: some View {
        Text(data)
            .font(.custom(textParameters.font, size: 10 * textParameters.scale))
            .foregroundColor(textParameters.mainTextColor)
            .clipped()
            .shadow(color: textParameters.shadowColor,
                    radius: 1)
            .frame(width: 24 * textParameters.scale, height: 24 * textParameters.scale)
    }
}
