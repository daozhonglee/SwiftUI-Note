//
//  ContentView.swift
//  wechat

import SwiftUI

struct ViewLayoutContentView: View {
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

struct ViewLayoutContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewLayoutContentView()
    }
}
