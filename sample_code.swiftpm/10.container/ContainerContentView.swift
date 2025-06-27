//
//  ContentView.swift
//  wechat

import SwiftUI

struct ContainerContentView: View {
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

struct ContainerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerContentView()
    }
}
