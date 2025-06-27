//
//  ContentView.swift
//  wechat

import SwiftUI

struct ShapeContentView: View {
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

struct ShapeContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeContentView()
    }
}
