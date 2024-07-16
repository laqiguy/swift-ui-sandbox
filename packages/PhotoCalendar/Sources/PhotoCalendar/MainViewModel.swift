//
//  MainViewModel.swift
//  
//
//  Created by Aleksei Tiurnin on 03.07.2024.
//

import Foundation
import SwiftUI

public class MainViewModel {
    @Published var image: Data? = UIImage(named: "jake", in: .module, with: .none)?.pngData()
    let current: Date
    @Published var date: Date
    @Published var month: Month
    @Published var showWeekNumber: Bool = false
    @Published var isBlurred: Bool = false
//    let manager = BusinessCalendarManager()
//    var businessCalendars: [Int: BusinessCalendar] = [:]

    public init(date: Date, calendarManager: CalendarManager) {
        current = date
        self.date = date
        month = Month(date: date, with: calendarManager.calendar)
    }

    func updateMonth() {
//        month.update(date, businessCalendar: manager.getBusinessCalendar(for: date))
    }

    func load() async {
//        await manager.load(for: date)
    }
}
