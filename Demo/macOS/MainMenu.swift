//
//  MainMenu.swift
//  Demo (macOS)
//
//  Created by Daniel Saidi on 2022-06-05.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct MainMenu: View {

    @Binding
    var selection: DemoScreen

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("RichTextKit")
                    .font(.largeTitle)
                VStack(alignment: .leading, spacing: 5) {
                    links
                }
                Spacer()
            }
            Spacer()
        }
        .font(.title2)
        .foregroundColor(.primary)
        .frame(minWidth: 200, alignment: .leading)
        .padding()
    }
}

extension MainMenu {

    var links: some View {
        Group {
            link(to: .editor)
            link(to: .about)
            webLink(to: .github)
            webLink(to: .documentation)
        }
    }

    func link(to screen: DemoScreen) -> some View {
        Button(action: { self.selection = screen }) {
            screen.label
        }.linkStyle(isSelected: isSelected(screen))
    }

    func webLink(to url: DemoUrl) -> some View {
        Link(destination: url.url) {
            url.label
        }.linkStyle()
    }
}

private extension View {

    func linkStyle(isSelected: Bool = false) -> some View {
        let color: Color = isSelected ? .white.opacity(0.1) : .clear
        return self
            .padding(5)
            .buttonStyle(.borderless)
            .background(color.cornerRadius(5))
    }
}

private extension MainMenu {

    func isSelected(_ screen: DemoScreen) -> Bool {
        self.selection == screen
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(selection: .constant(.editor))
    }
}
