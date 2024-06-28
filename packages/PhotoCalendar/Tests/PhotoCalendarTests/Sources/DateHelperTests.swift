import Foundation
import Testing
@testable import PhotoCalendar

@Suite("Date Helper Tests for ru") struct DateHelperTestsForRu {
    
    let manager = CalendarManager(option: .ru)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func monthStartTest() {
        let dates = [("03.01.2024", "01.01.2024"),
                     ("23.05.2067", "01.05.2067"),
                     ("19.12.1999", "01.12.1999"),
                     ("10.10.1010", "01.10.1010"),
                     ("25.10.1991", "01.10.1991"),
                     ("02.01.2025", "01.01.2025"),
                     ("01.01.2027", "01.01.2027"),
        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resDate = Date.Helper.startOfMonth(for: date, with: calendar)
            #expect(DateGenerator.string(from: resDate) == result)
        }
    }
    
    @Test func monthEndTest() {
        let dates = [("03.01.2024", "31.01.2024"),
                     ("23.05.2067", "31.05.2067"),
                     ("19.12.1999", "31.12.1999"),
                     ("10.10.1010", "31.10.1010"),
                     ("25.10.1991", "31.10.1991"),
                     ("02.02.2025", "28.02.2025"),
                     ("24.02.2024", "29.02.2024"),
                     ("01.04.2027", "30.04.2027"),
        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resDate = Date.Helper.endOfMonth(for: date, with: calendar)
            #expect(DateGenerator.string(from: resDate) == result)
        }
    }
    
    @Test func monthNameTest() {
        let dates = [("03.01.2024", "январь"),
                     ("23.02.2067", "февраль"),
                     ("19.03.1999", "март"),
                     ("10.04.1010", "апрель"),
                     ("25.05.1991", "май"),
                     ("02.06.2025", "июнь"),
                     ("24.07.2024", "июль"),
                     ("16.08.2027", "август"),
                     ("23.09.2027", "сентябрь"),
                     ("29.10.2027", "октябрь"),
                     ("30.11.2027", "ноябрь"),
                     ("31.12.2027", "декабрь"),

        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resName = Date.Helper.monthName(for: date, with: calendar)
            #expect(resName == result)
        }
    }
}

@Suite("Date Helper Tests for en") struct DateHelperTestsForEn {
    
    let manager = CalendarManager(option: .en)
    
    var calendar: Calendar {
        manager.calendar
    }
    
    @Test func monthStartTest() {
        let dates = [("03.01.2024", "01.01.2024"),
                     ("23.05.2067", "01.05.2067"),
                     ("19.12.1999", "01.12.1999"),
                     ("10.10.1010", "01.10.1010"),
                     ("25.10.1991", "01.10.1991"),
                     ("02.01.2025", "01.01.2025"),
                     ("01.01.2027", "01.01.2027"),
        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resDate = Date.Helper.startOfMonth(for: date, with: calendar)
            #expect(DateGenerator.string(from: resDate) == result)
        }
    }
    
    @Test func monthEndTest() {
        let dates = [("03.01.2024", "31.01.2024"),
                     ("23.05.2067", "31.05.2067"),
                     ("19.12.1999", "31.12.1999"),
                     ("10.10.1010", "31.10.1010"),
                     ("25.10.1991", "31.10.1991"),
                     ("02.02.2025", "28.02.2025"),
                     ("24.02.2024", "29.02.2024"),
                     ("01.04.2027", "30.04.2027"),
        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resDate = Date.Helper.endOfMonth(for: date, with: calendar)
            #expect(DateGenerator.string(from: resDate) == result)
        }
    }
    
    @Test func monthNameTest() {
        let dates = [("03.01.2024", "january"),
                     ("23.02.2067", "february"),
                     ("19.03.1999", "march"),
                     ("10.04.1010", "april"),
                     ("25.05.1991", "may"),
                     ("02.06.2025", "june"),
                     ("24.07.2024", "july"),
                     ("16.08.2027", "august"),
                     ("23.09.2027", "september"),
                     ("29.10.2027", "october"),
                     ("30.11.2027", "november"),
                     ("31.12.2027", "december"),

        ]
        
        for (input, result) in dates {
            let date = DateGenerator.date(from: input)
            let resName = Date.Helper.monthName(for: date, with: calendar)
            #expect(resName == result)
        }
    }
}
