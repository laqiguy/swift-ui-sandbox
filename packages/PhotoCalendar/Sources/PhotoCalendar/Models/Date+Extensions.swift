import Foundation

extension Date {
    var startOfMonth: Date {
        return Helper.startOfMonth(for: self, with: calendarManager.calendar)
    }
    
    var endOfMonth: Date {
        return Helper.endOfMonth(for: self, with: calendarManager.calendar)
    }
    
    var monthName: String {
        return Helper.monthName(for: self, with: calendarManager.calendar)
    }
}
