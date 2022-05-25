//
//  ContentView.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-22.
//



import RichTextKit
import SwiftUI

struct ContentView: View {

    @State
    private var text = NSAttributedString(string: "<u>test</u>")

    @StateObject
    private var context = RichTextContext()

    var body: some View {
        VStack {
            RichTextEditor(text: $text, context: context)
                .cornerRadius(5)
                .frame(maxHeight: .infinity)
            Divider()
            Text(text.string)
            Divider()
            Button("Change text") {
                text = NSAttributedString(string: "\(Date())")
            }
            Divider()
            Button("Change text") {
                text = NSAttributedString(string: "\(Date())")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
