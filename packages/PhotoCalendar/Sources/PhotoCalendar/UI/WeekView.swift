//
//  TextLineView.swift
//  MyCalendar
//
//  Created by Aleksei Tiurnin on 10.03.2023.
//

import SwiftUI

struct WeekView: View {
    
    let data: [Month.Day]
    @EnvironmentObject var textParameters: TextParameters

    var body: some View {
        HStack(alignment: .center, spacing: 4 * textParameters.scale) {
            ForEach(data, id: \.id) { model in
                Text(model.value)
                    .font(.custom(textParameters.font, size: 14 * textParameters.scale))
                    .foregroundColor(
                        (model.status == .dayoff
                         ? textParameters.dayoffTextColor
                         : textParameters.mainTextColor
                        )
                        .opacity(model.isCurrentMonth ? 1.0 : 0.6))
                    .clipped()
                    .shadow(color: textParameters.shadowColor,
                            radius: 1)
                    .frame(width: 24 * textParameters.scale, height: 24 * textParameters.scale)
            }
        }
    }
}

#Preview {
    var style = Date.FormatStyle()
        .year(.twoDigits)
        .month(.twoDigits)
        .day(.twoDigits)
    
    WeekView(data: [
        .init(date: try! style.parse("01.01.2024"), isCurrentMonth: true, status: .dayoff),
        .init(date: try! style.parse("02.01.2024"), isCurrentMonth: true, status: .normal),
        .init(date: try! style.parse("03.01.2024"), isCurrentMonth: true, status: .shorten),
        .init(date: try! style.parse("04.01.2024"), isCurrentMonth: false, status: .normal),
        .init(date: try! style.parse("05.01.2024"), isCurrentMonth: false, status: .dayoff),
        .init(date: try! style.parse("06.01.2024"), isCurrentMonth: false, status: .shorten),
    ]).environmentObject(TextParameters())
}
