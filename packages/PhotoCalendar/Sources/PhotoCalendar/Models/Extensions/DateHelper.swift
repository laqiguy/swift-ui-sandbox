import Foundation

extension Date {
    enum Helper {
        static func startOfMonth(for date: Date, with calendar: Calendar) -> Date {
            let components: Set<Calendar.Component> = [.year, .month]
            return calendar.date(from: calendar.dateComponents(components,from: date))!
        }
        
        static func endOfMonth(for date: Date, with calendar: Calendar) -> Date {
            let startOfMonth = startOfMonth(for: date, with: calendar)
            return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        }
        
        static func monthName(for date: Date, with calendar: Calendar) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = calendar.locale
            dateFormatter.dateFormat = "LLLL"
            return dateFormatter.string(from: date).lowercased()
        }
    }
}

extension DateInterval {
    static func arrayOfDays(for dateInterval: DateInterval, with calendar: Calendar) -> [Date] {
        if dateInterval.start > dateInterval.end { return [Date]() }

        var tempDate = dateInterval.start
        var array = [tempDate]

        while tempDate < dateInterval.end {
            tempDate = calendar.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
}
