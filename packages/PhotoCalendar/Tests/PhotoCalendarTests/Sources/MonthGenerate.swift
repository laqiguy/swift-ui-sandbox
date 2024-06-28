import Foundation
import Testing
@testable import PhotoCalendar

@Suite("week days array for month generate") struct MonthGenerateTests {

    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func April2024Test() {
        let date = DateGenerator.date(from: "01.04.2024")
        let month = makeMonth(from: date, with: calendar)
        
        #expect(month.count == 5)
    }
    
    @Test func March2024Test() {
        let date = DateGenerator.date(from: "01.03.2024")
        let month = makeMonth(from: date, with: calendar)
        
        #expect(month.count == 5)
    }
    
    @Test func Feb2024Test() {
        let date = DateGenerator.date(from: "01.02.2024")
        let month = makeMonth(from: date, with: calendar)
        
        #expect(month.count == 5)
    }
    
    @Test func Sep2024Test() {
        let date = DateGenerator.date(from: "01.09.2024")
        let month = makeMonth(from: date, with: calendar)
        
        #expect(month.count == 6)
    }
}
