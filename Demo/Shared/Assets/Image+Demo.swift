//
//  Image+Demo.swift
//  Demo
//
//  Created by Daniel Saidi on 2022-06-05.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension Image {

    static let about = symbol("lightbulb")
    static let documentation = symbol("doc.text")
    static let highlighter = symbol("highlighter")
    static let menu = symbol("line.3.horizontal")
    static let minus = symbol("minus")
    static let plus = symbol("plus")
    static let safari = symbol("safari")
    static let textEditor = symbol("doc.richtext")

    static func symbol(_ named: String) -> Image {
        Image(systemName: named)
    }
}
