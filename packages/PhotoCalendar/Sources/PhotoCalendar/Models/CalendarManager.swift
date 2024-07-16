import Foundation

public final class CalendarManager: ObservableObject {
    
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
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: id)
        calendar.firstWeekday = 2

        return calendar
    }
    
    public init(option: Option) {
        self.option = option
        self.calendar = CalendarManager.calendar(with: option)
    }
}
