import Foundation
import Testing
@testable import PhotoCalendar

@Suite("DateInterval Extension Tests") struct DateIntervalExtensionTests {
    
    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func oneDayTest() {
        let start = DateGenerator.date(from: "01.01.2024")
        let end = DateGenerator.date(from: "01.01.2024")
        
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        
        #expect(days.count == 1)
    }
    
    @Test func twoDayTest() {
        let start = DateGenerator.date(from: "01.01.2024")
        let end = DateGenerator.date(from: "02.01.2024")
        
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        
        #expect(days.count == 2)
    }
    
    @Test func monthTest() {
        let start = DateGenerator.date(from: "01.01.2024")
        let end = DateGenerator.date(from: "31.01.2024")
        
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        
        #expect(days.count == 31)
    }
}
