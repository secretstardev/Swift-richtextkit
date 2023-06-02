//
//  RichTextActionButtonGroup.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-08.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This view can be used to list a collection of buttons for a
 set of ``RichTextAction`` values in a bordered button group.

 Since this view controls multiple values, it binds directly
 to a ``RichTextContext`` instead of individual values.
 */
@available(iOS 15.0, macOS 12.0, *)
public struct RichTextActionButtonGroup: View {

    /**
     Create a rich text action button stack.

     - Parameters:
       - context: The context to affect.
       - actions: The actions to list, by default all non-size actions.
       - greedy: Whether or not the group is horizontally greedy, by default `true`.
     */
    public init(
        context: RichTextContext,
        actions: [RichTextAction],
        greedy: Bool = true
    ) {
        self._context = ObservedObject(wrappedValue: context)
        self.actions = actions
        self.isGreedy = greedy
    }

    private let actions: [RichTextAction]
    private let isGreedy: Bool

    @ObservedObject
    private var context: RichTextContext

    public var body: some View {
        ControlGroup {
            ForEach(actions) {
                RichTextActionButton(
                    action: $0,
                    context: context,
                    fillVertically: true
                )
            }
        }.frame(width: groupWidth)
    }
}

@available(iOS 15.0, macOS 12.0, *)
private extension RichTextActionButtonGroup {

    var groupWidth: CGFloat? {
        if isGreedy { return nil }
        let count = Double(actions.count)
        #if os(macOS)
        return 30 * count
        #else
        return 50 * count
        #endif
    }
}

@available(iOS 15.0, macOS 12.0, *)
struct RichTextActionButtonGroup_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject
        private var context = RichTextContext()

        func group(greedy: Bool) -> some View {
            RichTextActionButtonGroup(
                context: context,
                actions: [.undoLatestChange, .redoLatestChange, .copy],
                greedy: greedy
            )
        }

        var body: some View {
            VStack {
                group(greedy: true)
                group(greedy: false)
            }
            .padding()
        }
    }

    static var previews: some View {
        Preview()
    }
}

private extension View {

    @ViewBuilder
    func bordered() -> some View {
        if #available(iOS 15.0, *) {
            self.buttonStyle(.bordered)
        } else {
            self
        }
    }
}
#endif
