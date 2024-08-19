import Foundation

public final class CalendarManager {
    
    public enum Option {
        case ru
        case en
    }
    
    public var option: Option = .ru {
        didSet {
            calendar = CalendarManager.calendar(with: option)
        }
    }
    var locale: Locale {
        return calendar.locale!
    }
    private(set) public var calendar: Calendar
    
    static func calendar(with option: Option) -> Calendar {
        let id = option == .ru ? "ru_RU" : "en_EN"
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = Calendar.current.timeZone
        calendar.locale = Locale(identifier: id)
        calendar.minimumDaysInFirstWeek = 1

        return calendar
    }
    
    public init(option: Option) {
        self.option = option
        self.calendar = CalendarManager.calendar(with: option)
    }
}
