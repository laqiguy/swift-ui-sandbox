import Foundation

func generateMonth(for date: Date, with calendar: Calendar) -> [[Date]] {
    let start = Date.Helper.startOfMonth(for: date, with: calendar)
    let end = Date.Helper.endOfMonth(for: date, with: calendar)
    
    let dateComponents: Set<Calendar.Component> = [.weekOfYear, .year]
    
    let startWeek = calendar.dateComponents(dateComponents, from: start)
    let endWeek = calendar.dateComponents(dateComponents, from: end)
    
    var iterator = DateComponents(year: startWeek.year!)
    let endWeekNumber = endWeek.weekOfYear! < startWeek.weekOfYear! ? endWeek.weekOfYear! + 52 : endWeek.weekOfYear!
    return (startWeek.weekOfYear!...endWeekNumber).map { weekNumber in
        iterator.weekOfYear = weekNumber
        return (calendar.firstWeekday...calendar.firstWeekday+6).map { number in
            iterator.weekday = number
            return calendar.date(from: iterator)!
        }
    }
}
