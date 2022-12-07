//
//  Character+Newline.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-29.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

extension Character {

    /**
     Check if a character is a `newLine` or `carriageReturn`.
     */
    var isNewLineSeparator: Bool {
        self == .newLine || self == .carriageReturn
    }
}
