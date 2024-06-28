import Foundation

func makeMonth(from date: Date, with calendar: Calendar) -> [[Date]] {
    let days = getMonthDays(for: date, with: calendar)
    let completed = completeToFullWeeks(days: days, with: calendar)
    let weeks = completed.chunked(into: 7)
    return weeks
}

func getMonthDays(for date: Date, with calendar: Calendar) -> [Date] {
    let interval = DateInterval(
        start: Date.Helper.startOfMonth(for: date, with: calendar),
        end: Date.Helper.endOfMonth(for: date, with: calendar))
    return DateInterval.arrayOfDays(for: interval, with: calendar)
}

func completeToFullWeeks(days: [Date], with calendar: Calendar) -> [Date] {
    var result = days
    
    guard !days.isEmpty,
          let first = days.first,
          let last = days.last
    else { return result }
    
    let dateComponents: Set<Calendar.Component> = [.weekday]
    
    let startComponents = calendar.dateComponents(dateComponents, from: first)
    
    let prefixCount = (startComponents.weekday! - calendar.firstWeekday + 7) % 7
    
    if prefixCount != 0 {
        let weekStart = calendar.date(byAdding: .day, value: -prefixCount, to: first)!
        let daysBeforeInterval = DateInterval(
            start: weekStart,
            end: calendar.date(byAdding: .day, value: -1, to: first)!)
        let daysBefore = DateInterval.arrayOfDays(for: daysBeforeInterval, with: calendar)
        result.insert(
            contentsOf: daysBefore,
            at: 0)
    }
            
    let postfixCount = 7 - result.count % 7
    
    if postfixCount != 7 {
        let lastDate = calendar.date(
            byAdding: .day,
            value: postfixCount,
            to: last)!

        let daysAfterInterval = DateInterval(
            start: calendar.date(byAdding: .day, value: 1, to: last)!,
            end: lastDate)
        let daysAfter = DateInterval.arrayOfDays(for: daysAfterInterval, with: calendar)
        result.append(contentsOf: daysAfter)
    }
    
    return result
}
