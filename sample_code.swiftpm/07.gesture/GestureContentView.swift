//
//  ContentView.swift
//  wechat

import SwiftUI

struct GestureContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct GestureContentView_Previews: PreviewProvider {
    static var previews: some View {
        GestureContentView()
    }
}
