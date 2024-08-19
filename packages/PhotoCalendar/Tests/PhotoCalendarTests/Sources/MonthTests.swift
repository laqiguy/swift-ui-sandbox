import Foundation
import Testing
@testable import PhotoCalendar

@Suite("Month model tests") struct MonthTests {

    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func April2024Test() {
        let date = DateGenerator.date(from: "12.04.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "апрель")
        #expect(month.values.count == 5)
        #expect(month.values[0].number == 14)
        #expect(month.values[4].number == 18)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "01.04.2024")
        #expect(DateGenerator.string(from: month.values[4].values[6].date) == "05.05.2024")
    }
    
    @Test func May2024Test() {
        let date = DateGenerator.date(from: "13.05.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "май")
        #expect(month.values.count == 5)
        #expect(month.values[0].number == 18)
        #expect(month.values[4].number == 22)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "29.04.2024")
        #expect(DateGenerator.string(from: month.values[4].values[6].date) == "02.06.2024")
    }

    @Test func June2024Test() {
        let date = DateGenerator.date(from: "14.06.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "июнь")
        #expect(month.values.count == 5)
        #expect(month.values[0].number == 22)
        #expect(month.values[4].number == 26)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "27.05.2024")
        #expect(DateGenerator.string(from: month.values[4].values[6].date) == "30.06.2024")
    }
    
    @Test func Septemnber2024Test() {
        let date = DateGenerator.date(from: "15.09.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "сентябрь")
        #expect(month.values.count == 6)
        #expect(month.values[0].number == 35)
        #expect(month.values[5].number == 40)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "26.08.2024")
        #expect(DateGenerator.string(from: month.values[5].values[6].date) == "06.10.2024")
    }
    
    @Test func December2024Test() {
        let date = DateGenerator.date(from: "23.12.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "декабрь")
        #expect(month.values.count == 6)
        #expect(month.values[0].number == 48)
        #expect(month.values[5].number == 1)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "25.11.2024")
        #expect(DateGenerator.string(from: month.values[5].values[6].date) == "05.01.2025")
    }
    
    @Test func Jan2024Test() {
        let date = DateGenerator.date(from: "01.01.2024")
        let month = Month(date: date, with: calendar)
        
        #expect(month.name == "январь")
        #expect(month.values.count == 5)
        #expect(month.values[0].number == 1)
        #expect(month.values[4].number == 5)
        for week in month.values {
            #expect(week.values.count == 7)
        }
        #expect(DateGenerator.string(from: month.values[0].values[0].date) == "01.01.2024")
        #expect(DateGenerator.string(from: month.values[4].values[6].date) == "04.02.2024")
    }
}
