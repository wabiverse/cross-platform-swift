import SwiftCrossUI
#if os(macOS)
  import AppKitBackend
  typealias PlatformBackend = AppKitBackend
#elseif os(Linux)
  import GtkBackend
  typealias PlatformBackend = GtkBackend
#elseif os(Windows)
  import WinUIBackend
  typealias PlatformBackend = WinUIBackend
#endif

class CounterState: Observable {
  @Observed var count = 0
}

/// cross platform (**macOS**, **Linux**, **Windows**) ui app in swift.
/// ```swift
/// dependencies: [
///   // 🦦 stackotter's swift-cross-ui.
///   .package(url: "https://github.com/stackotter/swift-cross-ui.git", branch: "main")
/// ],
/// ```
@main
struct CounterApp: App {
  typealias Backend = PlatformBackend

  let identifier = "foundation.wabi.CounterApp"

  let state = CounterState()

  var body: some Scene {
    WindowGroup("CounterApp") {
      HStack {
        Button("-") { state.count -= 1 }
        Text("Count: \(state.count)")
        Button("+") { state.count += 1 }
      }
      .padding(10)
    }
  }
}
