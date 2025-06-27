//
//  TabViewContentView.swift
//  SwiftUI示例代码 - TabView 视图布局演示
//  
//  本文件演示了 SwiftUI 中 TabView 的各种用法：
//  1. 基础 TabView 用法
//  2. 带选择和标签的 TabView
//  3. 页面样式的 TabView
//  4. 自定义 TabBar 枚举定义

import SwiftUI

/// TabView 内容视图 - 演示各种 TabView 的使用方式
struct TabViewContentView: View {
    /// 当前选中的标签页索引
    @State private var selectedTab = 2
  
    var body: some View {
        // 可以切换不同的演示效果，取消注释即可查看
        // tabViewDemo01  // 最简 TabView 示例
        // tabViewDemo02  // 带标签和选择的 TabView
        tabViewDemo03     // 页面样式的 TabView
    }
    
    // MARK: - TabView 演示1：最简示例
    /// 基础的 TabView 实现，展示四个简单的标签页
    private var tabViewDemo01: some View {
        TabView(selection: $selectedTab) {
            Text("设置一").tabItem {
                Image(systemName: "arkit").foregroundColor(.red)  // AR 图标，红色
                Text("设置一")
            }
            
            Text("设置二").tabItem {
                Image(systemName: "star")  // 星星图标，默认颜色
                Text("设置二")
            }
            
            Text("设置三").tabItem {
                Image(systemName: "star").foregroundColor(.red)  // 星星图标，红色
                Text("设置三")
            }
            
            Text("设置四").tabItem {
                Image(systemName: "star").foregroundColor(.red)  // 星星图标，红色
                Text("设置四")
            }
        }
    }
    
    // MARK: - TabView 演示2：带标签和交互
    /// 更完整的 TabView 实现，包含：
    /// - tag 属性用于标识每个标签页
    /// - badge 角标显示
    /// - 点击手势处理
    /// 注意：TabView 只支持 Text、Image 或 Image+Text 的 tabItem 组合
    private var tabViewDemo02: some View {
        TabView(selection: $selectedTab) {
            Text("设置一")
                .tabItem {
                    Image(systemName: "arkit").foregroundColor(.red)
                    Text("设置一")
                }
                .onTapGesture {
                    self.selectedTab = 3  // 点击时切换到第4个标签页
                }
                .tag(0)  // 标签页标识符
            
            Text("设置二")
                .tabItem {
                    Image(systemName: "star")
                    Text("设置二")
                }
                .tag(1)
            
            Text("设置三")
                .badge(2)  // 显示角标数字2
                .tabItem {
                    Image(systemName: "star").foregroundColor(.red)
                    Text("设置三")
                }
                .tag(2)  // 默认选中的标签页
            
            Text("设置四")
                .tabItem {
                    Image(systemName: "star").foregroundColor(.red)
                    Text("设置四")
                }
                .tag(3)
        }
    }
    
    // MARK: - TabView 演示3：页面样式
    /// 页面样式的 TabView，类似于 PageView 的效果
    /// 在 iOS 上使用 .page 样式，在 macOS 上使用默认样式
    private var tabViewDemo03: some View {
        ZStack {
            // 背景颜色
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selectedTab) {
                // 自定义主页面视图
                MainView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "house")
                        Text("首页")
                    }
                    .tag(0)
                
                // 简单的文本页面
                Text("📚大全")
                    .font(.largeTitle)
                    .tabItem {
                        Image(systemName: "book")
                        Text("大全")
                    }
                    .tag(1)
                
                Text("设置")
                    .font(.largeTitle)
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("设置")
                    }
                    .tag(2)
            }
            #if os(iOS)
            .tabViewStyle(.page)  // 页面样式，支持左右滑动切换（仅 iOS）
            #endif
        }
    }
}

// MARK: - 自定义主页面视图
/// 主页面视图组件，包含标题和切换按钮
struct MainView: View {
    /// 绑定的选中标签页索引，用于从子视图控制父视图的标签切换
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("首页")
                .font(.title)
                .fontWeight(.semibold)
            
            // 切换标签页的按钮
            Button(action: {
                selectedTab = 2  // 点击按钮切换到设置页面
            }, label: {
                Text("切换到setting tab")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.purple.cornerRadius(10))
            })
        }
    }
}

// MARK: - 全局环境变量观察者
/// 用于观察和管理 TabBar 选中状态的全局环境变量
/// 使用 ObservableObject 协议，支持状态变化通知
final class TabBarIndexObserver: ObservableObject {
    /// 当前选中的 TabBar 项目
    @Published var tabSelected: TabBarItem = .home
}

// MARK: - TabBar 项目枚举
/// 定义 TabBar 的各个项目及其属性
/// 包含标题、图标等信息
enum TabBarItem: Int {
    case home     // 首页
    case living   // 直播
    case message  // 消息
    case mine     // 我的
    
    /// 获取每个标签页的标题文字
    var titleStr: String {
        switch self {
        case .home:
            return "首页"
        case .living:
            return "直播"
        case .message:
            return "消息"
        case .mine:
            return "我的"
        }
    }
    
    /// 获取未选中状态的图标
    /// 注意：这里的图片名称为空，实际使用时需要替换为真实的图片资源名称
    var normalImage: Image {
        var imageName = ""
        switch self {
        case .home:
            imageName = "home_normal"      // 实际项目中应该是具体的图片名称
        case .living:
            imageName = "living_normal"
        case .message:
            imageName = "message_normal"
        case .mine:
            imageName = "mine_normal"
        }
        return Image(imageName)
    }
    
    /// 获取选中状态的图标
    /// 注意：这里的图片名称为空，实际使用时需要替换为真实的图片资源名称
    var selectedImage: Image {
        var imageName = ""
        switch self {
        case .home:
            imageName = "home_selected"    // 实际项目中应该是具体的图片名称
        case .living:
            imageName = "living_selected"
        case .message:
            imageName = "message_selected"
        case .mine:
            imageName = "mine_selected"
        }
        return Image(imageName)
    }
}

// MARK: - 预览
struct TabViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewContentView()
    }
}
