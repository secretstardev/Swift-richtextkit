//
//  RichTextDataFormatMenu.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This menu can be used to trigger various actions for a list
 of ``RichTextDataFormat`` values.

 The menu uses customizable actions, which means that it can
 be used in toolbars, macOS commands etc. It has an optional
 `pdf` action, which for instance can be used when exporting
 or sharing rich text.
 */
public struct RichTextDataFormatMenu: View {

    public init(
        title: String,
        icon: Image,
        formats: [RichTextDataFormat] = RichTextDataFormat.libraryFormats,
        formatAction: @escaping (RichTextDataFormat) -> Void,
        pdfAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.icon = icon
        self.formats = formats
        self.formatAction = formatAction
        self.pdfAction = pdfAction
    }

    private let title: String
    private let icon: Image
    private let formats: [RichTextDataFormat]
    private let formatAction: (RichTextDataFormat) -> Void
    private let pdfAction: (() -> Void)?

    public var body: some View {
        Menu {
            ForEach(formats) { format in
                Button(action: { formatAction(format) }) {
                    Label {
                        Text(format.fileFormatText)
                    } icon: {
                        icon
                    }
                }
            }
            if let action = pdfAction {
                Button(action: action) {
                    Label {
                        Text(RTKL10n.fileFormatPdf.text)
                    } icon: {
                        icon
                    }
                }
            }
        } label: {
            Label {
                Text(title)
            } icon: {
                icon
            }
        }
    }
}

struct RichTextDataFormatMenu_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            RichTextDataFormatMenu(
                title: "Export...",
                icon: .richTextMenuExport,
                formatAction: { _ in },
                pdfAction: {}
            )
        }
    }
}
