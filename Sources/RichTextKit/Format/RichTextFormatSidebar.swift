//
//  RichTextFormatSidebar.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-13.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This sidebar view provides various text format options, and
 is meant to be used on macOS, in a trailing sidebar.

 > Important: Although this view is designed for macOS, it's
 not excluded for iOS, since it should be to the docs. If we
 find a way to combine all platform docs, we can exclude the
 view for iOS as well. Until then, don't use it on iOS since
 it will look off.
 */
public struct RichTextFormatSidebar: View {

    /**
     Create a rich text format sheet.

     - Parameters:
       - context: The context to apply changes to.
     */
    public init(
        context: RichTextContext
    ) {
        self._context = ObservedObject(wrappedValue: context)
    }

    @ObservedObject
    private var context: RichTextContext

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SidebarSection(title: RTKL10n.font.text) {
                RichTextFontPicker(selection: $context.fontName, fontSize: 12)
                HStack {
                    styleToggles
                    RichTextFontSizePickerStack(context: context)
                }
            }
            SidebarSection(title: nil) {
                HStack {
                    Text(RTKL10n.foregroundColor.text)
                    Spacer()
                    RichTextColorPicker(color: .foreground, context: context)
                }
                HStack {
                    Text(RTKL10n.backgroundColor.text)
                    Spacer()
                    RichTextColorPicker(color: .background, context: context)
                }
            }.font(.callout)
            SidebarSection(title: nil) {
                RichTextAlignmentPicker(selection: $context.textAlignment)
                    .pickerStyle(.segmented)
                indentButtons
            }
            Spacer()
        }
        .padding(8)
        .background(Color.white.opacity(0.05))
    }
}

private extension RichTextFormatSidebar {

    @ViewBuilder
    var styleToggles: some View {
        if #available(iOS 15.0, macOS 12.0, *) {
            RichTextStyleToggleGroup(context: context)
        } else {
            RichTextStyleToggleStack(context: context)
        }
    }

    @ViewBuilder
    var indentButtons: some View {
        if #available(iOS 15.0, macOS 12.0, *) {
            RichTextActionButtonGroup(
                context: context,
                actions: [.decreaseIndent, .increaseIndent]
            )
        }
    }
}

private struct SidebarSection<Content: View>: View {

    let title: String?

    @ViewBuilder
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Text(title).font(.headline)
            }
            content()
            Divider()
        }
    }
}

struct RichTextFormatSidebar_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject
        private var context = RichTextContext()

        var body: some View {
            RichTextFormatSidebar(context: context)
        }
    }

    static var previews: some View {
        Preview()
            .frame(width: 250)
    }
}
#endif
