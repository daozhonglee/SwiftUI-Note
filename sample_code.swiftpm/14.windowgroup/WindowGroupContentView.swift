import SwiftUI

struct WindowGroupContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

@main
struct MyWindowGroupApp: App {
    var body: some Scene {
        WindowGroup {
            WindowGroupContentView()
        }
        WindowGroup ("这是第二个窗口"){
            Text("这是第二个窗口")
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

struct WindowGroupContentView_Previews: PreviewProvider {
    static var previews: some View {
        WindowGroupContentView()
    }
}
