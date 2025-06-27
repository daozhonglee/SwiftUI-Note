//
//  SwiftUIView.swift
//  sample_code
//

import SwiftUI

struct TextContentView: View {
    var body: some View {
        // 这是一个静态文本
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("This is some longer text that is limited to three lines maximum, so anything more than that will cause the text to clip.")
            .lineLimit(3) // 限制文本行数,如果您在某些文本上设置了行数限制，然后为其提供的字符串太长而无法容纳在可用空间中，则 SwiftUI 将截断文本，使其以“...”结尾。
            .frame(width: 200) // 设置文本宽度
            .truncationMode(.middle) // 设置截断模式, 默认是 .tail
    }
}

#Preview {
    TextContentView()
}
