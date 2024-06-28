import Foundation
import Testing
@testable import PhotoCalendar

@Suite("Month Days Tests") struct MonthDaysTests {
    
    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func jan2024DaysTest() {
        let date = DateGenerator.date(from: "03.01.2024")
        
        let days = getMonthDays(for: date, with: calendar)
        
        #expect(days.count == 31)
        #expect(DateGenerator.string(from: days.first!) == "01.01.2024")
        #expect(DateGenerator.string(from: days.last!) == "31.01.2024")
        #expect(DateGenerator.string(from: days[14]) == "15.01.2024")
    }
    
    @Test func april2001DaysTest() {
        let date = DateGenerator.date(from: "03.04.2001")
        
        let days = getMonthDays(for: date, with: calendar)
        
        #expect(days.count == 30)
        #expect(DateGenerator.string(from: days.first!) == "01.04.2001")
        #expect(DateGenerator.string(from: days.last!) == "30.04.2001")
        #expect(DateGenerator.string(from: days[14]) == "15.04.2001")
    }
    
    @Test func feb2024DaysTest() {
        let date = DateGenerator.date(from: "22.02.2024")
        
        let days = getMonthDays(for: date, with: calendar)
        
        #expect(days.count == 29)
        #expect(DateGenerator.string(from: days.first!) == "01.02.2024")
        #expect(DateGenerator.string(from: days.last!) == "29.02.2024")
        #expect(DateGenerator.string(from: days[14]) == "15.02.2024")
    }
    
    @Test func feb2022DaysTest() {
        let date = DateGenerator.date(from: "22.02.2022")
        
        let days = getMonthDays(for: date, with: calendar)
        
        #expect(days.count == 28)
        #expect(DateGenerator.string(from: days.first!) == "01.02.2022")
        #expect(DateGenerator.string(from: days.last!) == "28.02.2022")
        #expect(DateGenerator.string(from: days[14]) == "15.02.2022")
    }

}
