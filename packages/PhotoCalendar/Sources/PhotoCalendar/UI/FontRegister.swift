//
//  FontRegister.swift
//  
//
//  Created by Aleksei Tiurnin on 12.07.2024.
//

import UIKit
import CoreGraphics
import CoreText

public enum FontError: Swift.Error {
   case failedToRegisterFont
}

func registerFont(named name: String, fileExtension: String) throws {
    var error: Unmanaged<CFError>?
    guard
        let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
        let fontDataProvider = CGDataProvider(url: url as CFURL),
        let font = CGFont(fontDataProvider),
        CTFontManagerRegisterGraphicsFont(font, &error) else {
        print("\(error?.takeRetainedValue())")
        throw error?.takeRetainedValue() ?? FontError.failedToRegisterFont
    }
}

