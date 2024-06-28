import Foundation
import Testing
@testable import PhotoCalendar

@Suite("Complete Days Array to full weeks") struct MonthCompletionTests {

    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func OneDayTest() {
        let start = DateGenerator.date(from: "02.04.2024")
        let end = DateGenerator.date(from: "02.04.2024")
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 7)
        #expect(DateGenerator.string(from: result.first!) == "01.04.2024")
        #expect(DateGenerator.string(from: result.last!) == "07.04.2024")
    }
    
    @Test func AnotherDayTest() {
        let start = DateGenerator.date(from: "05.04.2024")
        let end = DateGenerator.date(from: "05.04.2024")
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 7)
        #expect(DateGenerator.string(from: result.first!) == "01.04.2024")
        #expect(DateGenerator.string(from: result.last!) == "07.04.2024")
    }
    
    @Test func OneWeekTest() {
        let start = DateGenerator.date(from: "01.04.2024")
        let end = DateGenerator.date(from: "07.04.2024")
        let interval = DateInterval(start: start, end: end)
        let days = DateInterval.arrayOfDays(for: interval, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 7)
        #expect(DateGenerator.string(from: result.first!) == "01.04.2024")
        #expect(DateGenerator.string(from: result.last!) == "07.04.2024")
    }
    
    @Test func April2024Test() {
        let start = DateGenerator.date(from: "01.04.2024")
        let days = getMonthDays(for: start, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 35)
        #expect(DateGenerator.string(from: result.first!) == "01.04.2024")
        #expect(DateGenerator.string(from: result.last!) == "05.05.2024")
    }
    
    @Test func March2024Test() {
        let start = DateGenerator.date(from: "01.03.2024")
        let days = getMonthDays(for: start, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 35)
        #expect(DateGenerator.string(from: result.first!) == "26.02.2024")
        #expect(DateGenerator.string(from: result.last!) == "31.03.2024")
    }
    
    @Test func Feb2024Test() {
        let start = DateGenerator.date(from: "01.02.2024")
        let days = getMonthDays(for: start, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 35)
        #expect(DateGenerator.string(from: result.first!) == "29.01.2024")
        #expect(DateGenerator.string(from: result.last!) == "03.03.2024")
    }
    
    @Test func Sep2024Test() {
        let start = DateGenerator.date(from: "01.09.2024")
        let days = getMonthDays(for: start, with: calendar)
        let result = completeToFullWeeks(days: days, with: calendar)
        
        #expect(result.count == 42)
        #expect(DateGenerator.string(from: result.first!) == "26.08.2024")
        #expect(DateGenerator.string(from: result.last!) == "06.10.2024")
    }
}
