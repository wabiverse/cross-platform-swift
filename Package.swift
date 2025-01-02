// swift-tools-version: 5.10
import PackageDescription

#if os(macOS)
  let uiBackend = "AppKitBackend"
#elseif os(Linux)
  let uiBackend = "GtkBackend"
#elseif os(Windows)
  let uiBackend = "WinUIBackend"
#endif

let package = Package(
  name: "cross-platform-swift",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10)
  ],
  products: [
    .executable(
      name: "CrossUI",
      targets: ["CrossUI"]
    ),
  ],
  dependencies: [
    // 🦦 stackotter's swift-cross-ui: https://github.com/stackotter/swift-cross-ui
    .package(url: "https://github.com/wabiverse/swift-cross-ui.git", branch: "main")
  ],
  targets: [
    // cross platform (macOS, Linux, Windows) ui app in swift.
    .executableTarget(
      name: "CrossUI",
      dependencies: [
        .product(name: "SwiftCrossUI", package: "swift-cross-ui"),
        .product(name: uiBackend, package: "swift-cross-ui")
      ]
    ),
  ]
)
