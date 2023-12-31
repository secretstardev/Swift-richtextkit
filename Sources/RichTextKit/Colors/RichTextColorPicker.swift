//
//  RichTextColorPicker.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-08.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This button can be used to select a certain color value. It
 renders an appropriate icon next to the color picker.

 If you don't want an icon, you can use a plain `ColorPicker`
 instead of this view.
 */
public struct RichTextColorPicker: View {

    /**
     Create a rich text color picker.

     - Parameters:
       - color: The color to pick.
       - value: The value to bind to.
     */
    public init(
        color: PickerColor,
        value: Binding<Color>
    ) {
        self.color = color
        self.value = value
    }

    /**
     Create a rich text color picker.

     - Parameters:
       - color: The color to pick.
       - context: The context to affect.
     */
    public init(
        color: PickerColor,
        context: RichTextContext
    ) {
        self.color = color
        switch color {
        case .foreground: self.value = context.foregroundColorBinding
        case .background: self.value = context.backgroundColorBinding
        }
    }

    private let color: PickerColor
    private let value: Binding<Color>

    public var body: some View {
        HStack {
            color.icon
            ColorPicker("", selection: value)
                .accessibilityLabel(color.localizedName)
        }
        .labelsHidden()
    }
}

public extension RichTextColorPicker {

    /**
     This enum specifies which colors this picker can pick.
     */
    enum PickerColor: String, CaseIterable, Identifiable {
        case foreground, background

        var icon: Image {
            switch self {
            case .foreground: return Image.richTextColorForeground
            case .background: return Image.richTextColorBackground
            }
        }
    }
}

public extension RichTextColorPicker.PickerColor {

    /// All available picker colors.
    static var all: [Self] { allCases }

    /// The color's unique identifier.
    var id: String { rawValue }

    /// The color's localized name.
    var localizedName: String {
        switch self {
        case .foreground: return RTKL10n.foregroundColor.text
        case .background: return RTKL10n.backgroundColor.text
        }
    }
}

public extension Collection where Element == RichTextColorPicker.PickerColor {

    /// All available picker colors.
    static var all: [RichTextColorPicker.PickerColor] { RichTextColorPicker.PickerColor.allCases }
}

struct RichTextColorPicker_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var text = Color.black

        @State
        private var background = Color.white

        var body: some View {
            HStack {
                RichTextColorPicker(color: .foreground, value: $text)
                RichTextColorPicker(color: .background, value: $background)
            }.padding()
        }
    }

    static var previews: some View {
        Preview()
    }
}
#endif
