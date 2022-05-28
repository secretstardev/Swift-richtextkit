//
//  RichTextViewRepresentable.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-22.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol defines a platform-agnostic api that's shared
 by the UIKit and AppKit implementation of ``RichTextView``.

 By implementing and using this protocol in the library, the
 library doesn't have to do a bunch of `#if` checks.

 This protocol aggregates many other protocols, although the
 protocol conformances below seem basic. This means that the
 protocol enabled a lot of additional functionality, such as
 setting attributes, fonts, styles etc.
 */
public protocol RichTextViewRepresentable:
    RichTextPresenter,
    RichTextStyleWriter {
    
    /**
     The text view's mutable attributed string, if any.
     */
    var mutableAttributedString: NSMutableAttributedString? { get }
}
