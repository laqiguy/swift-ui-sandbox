//
//  WeekHeaderView.swift
//  MyCalendar
//
//  Created by Aleksei Tiurnin on 29.03.2023.
//

import SwiftUI

struct WeekHeaderView: View {
    
    var data: [String]
    @EnvironmentObject var textParameters: TextParameters
    
    var body: some View {
        HStack(alignment: .center, spacing: 4 * textParameters.scale) {
            ForEach(data, id: \.self) { value in
                Text(value)
                    .font(.custom(textParameters.font, size: 14 * textParameters.scale))
                    .foregroundColor(textParameters.mainTextColor)
                    .clipped()
                    .shadow(color: textParameters.shadowColor,
                            radius: 1)
                    .frame(width: 24 * textParameters.scale, height: 24 * textParameters.scale)
            }
        }
    }
}
