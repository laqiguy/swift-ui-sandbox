//
//  CGSize+Operators.swift
//  
//
//  Created by Aleksei Tiurnin on 12.07.2024.
//

import Foundation

func +(left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
}

infix operator +=
public func +=(left: inout CGSize, right: CGSize) {
    left.width += right.width
    left.height += right.height
}
