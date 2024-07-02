//
//  File.swift
//  
//
//  Created by Aleksei Tiurnin on 26.03.2024.
//

import Foundation

enum DateGenerator {
    
    private static let formatter = Date
        .FormatStyle()
        .year(.twoDigits)
        .month(.twoDigits)
        .day(.twoDigits)
    
    static func date(from: String) -> Date {
        return try! formatter.parse(from)
    }
    
    static func string(from: Date) -> String {
        return formatter.format(from)
    }
}
