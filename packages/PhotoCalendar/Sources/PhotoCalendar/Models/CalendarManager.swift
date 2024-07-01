import Foundation

public class CalendarManager {
    
    enum Option {
        case ru
        case en
    }
    
    var option: Option = .ru {
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
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: id)
        calendar.firstWeekday = 2

        return calendar
    }
    
    init(option: Option) {
        self.option = option
        self.calendar = CalendarManager.calendar(with: option)
    }
}

let calendarManager = CalendarManager(option: .ru)
