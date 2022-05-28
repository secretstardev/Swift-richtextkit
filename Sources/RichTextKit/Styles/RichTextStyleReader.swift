//
//  RichTextStyleReader.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-28.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented any types that can provide
 extended rich text style capabilities.

 The protocol is implemented by `NSAttributedString` as well
 as other library types.
 */
public protocol RichTextStyleReader: RichTextFontReader {}

extension NSAttributedString: RichTextStyleReader {}

public extension RichTextStyleReader {

//    /**
//     Get a rich text attribute at the provided range.
//
//     The function uses `safeRange(for:)` to handle incorrect
//     ranges, which is not handled by the native functions.
//
//     - Parameters:
//       - key: The attribute to get.
//       - range: The range to get the attribute from.
//     */
//    func richTextAttribute<Value>(
//        _ key: NSAttributedString.Key,
//        at range: NSRange
//    ) -> Value? {
//        richTextAttributes(at: range)[key] as? Value
//    }
//
//    /**
//     Get all rich text attributes at the provided range.
//
//     The function uses `safeRange(for:)` to handle incorrect
//     ranges, which is not handled by the native functions.
//
//     - Parameters:
//       - range: The range to get attributes from.
//     */
//    func richTextAttributes(
//        at range: NSRange
//    ) -> [NSAttributedString.Key: Any] {
//        if richText.length == 0 { return [:] }
//        let range = safeRange(for: range)
//        return richText.attributes(at: range.location, effectiveRange: nil)
//    }


    /**
     Get the rich text styles at a certain range.

     - Parameters:
       - range: The range to get the traits from.
     */
    func richTextStyles(at range: NSRange) -> [RichTextStyle] {
        let attributes = richTextAttributes(at: range)
        let traits = font(at: range)?.fontDescriptor.symbolicTraits
        var styles = traits?.enabledRichTextStyles ?? []
        if attributes.isUnderlined { styles.append(.underlined) }
        return styles
    }
}
