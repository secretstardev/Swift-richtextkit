//
//  ContentView.swift
//  Demo (macOS)
//
//  Created by Daniel Saidi on 2022-06-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import RichTextKit
import SwiftUI

struct ContentView: View {

    @State
    private var screen = DemoScreen.editor

    @State
    private var text = NSAttributedString(string: "test")

    @StateObject
    var context = RichTextContext()

    var body: some View {
        NavigationView {
            MainMenu(selection: $screen)
            screenView
                .navigationTitle("RichTextKit")
        }
    }
}

extension ContentView {

    @ViewBuilder
    var screenView: some View {
        switch screen {
        case .about: AboutScreen()
        case .editor: EditorScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
