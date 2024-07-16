//
//  MyCalendarApp.swift
//  MyCalendar
//
//  Created by Aleksei Tiurnin on 07.03.2023.
//

import SwiftUI
import PhotoCalendar

@main
struct MainApp: App {
    
    let calendarManager = CalendarManager(option: .ru)
    let textParametes = TextParameters()
    
    var body: some Scene {
        WindowGroup {
            MainView(calendarManager: calendarManager)
        }
        .environmentObject(textParametes)
    }
}
