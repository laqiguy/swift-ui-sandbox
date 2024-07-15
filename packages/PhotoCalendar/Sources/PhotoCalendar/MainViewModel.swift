//
//  MainViewModel.swift
//  
//
//  Created by Aleksei Tiurnin on 03.07.2024.
//

import Foundation
import SwiftUI

class MainViewModel {
    @Published var image: Data? = UIImage(named: "jake", in: .module, with: .none)?.pngData()
    let current: Date
    @Published var date: Date
    @Published var month: Month
    @Published var showWeekNumber: Bool = false
    @Published var isBlurred: Bool = false
//    let manager = BusinessCalendarManager()
//    var businessCalendars: [Int: BusinessCalendar] = [:]
    
    let weekDaysNames: [String]
    
    init(date: Date) {
        self.current = date
        self.date = date
        self.month = Month(date: date, with: Calendar.current) //Month.generate(for: date, businessCalendar: manager.getBusinessCalendar(for: date))
        
        var weekdays = Calendar.current.veryShortWeekdaySymbols
        let first = weekdays.remove(at: 0)
        weekdays.append(first)
        weekDaysNames = weekdays
    }
    
    func updateMonth() {
//        month.update(date, businessCalendar: manager.getBusinessCalendar(for: date))
    }
    
    func load() async {
//        await manager.load(for: date)
    }
}
