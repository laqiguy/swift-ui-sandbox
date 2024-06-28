//
//  File.swift
//  
//
//  Created by Aleksei Tiurnin on 26.03.2024.
//

import Foundation

enum DateGenerator {
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    static func date(from: String) -> Date {
        return formatter.date(from: from)!
    }
    
    static func string(from: Date) -> String {
        return formatter.string(from: from)
    }
}
