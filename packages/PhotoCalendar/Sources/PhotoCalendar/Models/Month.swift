import Foundation

protocol DayChecker {
    func status(for date: Date) -> Month.Day.Status
}

struct Month {
    
    typealias Week = (number: Int, values: [Day])
    
    struct Day: Identifiable {
        typealias ID = String
        
        enum Status {
            case normal
            case shorten
            case dayoff
        }
        
        let id: ID
        let date: Date
        let value: String
        let isCurrentMonth: Bool
        var status: Status
        
        init(date: Date, isCurrentMonth: Bool, status: Status = .normal) {
            self.id = date.formatted(.iso8601.day().month().year())
            self.date = date
            self.isCurrentMonth = isCurrentMonth
            self.status = status
            self.value = date.formatted(.dateTime.day(.defaultDigits))
        }
    }
    
    // MARK: - Variables
    
    let id: String
    var name: String
    var values: [Week]
    
    init(name: String, weeks: [Week]) {
        let date = weeks[0].values.first(where: { $0.isCurrentMonth })!.date
        self.id = date.formatted(.iso8601.month().year())
        self.name = name
        self.values = weeks
    }
    
    init(date: Date, with calendar: Calendar) {
        let weekDates = generateMonth(for: date, with: calendar)
        let weeks = weekDates
            .map { week in
                week.map { day in
                    Day(
                        date: day,
                        isCurrentMonth: calendar.isDate(day, equalTo: date, toGranularity: .month)
                    )
                }
            }.map { week in
                (number: calendar.component(.weekOfYear, from: week[0].date), values: week)
            }
        self.init(name: date.monthName, weeks: weeks)
    }
    
    mutating func updateDaysStatus(with checker: DayChecker) {
        for i in 0..<values.count {
            for j in 0..<values[i].values.count {
                values[i].values[j].status = checker.status(for: values[i].values[j].date)
            }
        }
    }
}
