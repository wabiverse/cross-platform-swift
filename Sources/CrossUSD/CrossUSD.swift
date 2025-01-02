import Foundation
import PixarUSD

/// cross platform universal scene description (usd) in swift.
/// ```swift
/// dependencies: [
///   // 🎬 pixar's universal scene description (usd): https://openusd.org
///   .package(url: "https://github.com/wabiverse/SwiftUSD.git", branch: "main")
/// ],
/// ```
@main
enum Creator
{
  static func main()
  {
    /* Setup all usd resources (python, plugins, resources). */

    Pixar.Bundler.shared.setup(.resources)

    /* Create a new USD stage with a transform and a sphere. */

    let stage: UsdStageRefPtr = Usd.Stage.createNew("HelloWorldExample", ext: .usd)

    UsdGeom.Xform.define(stage, path: "/Hello")
    UsdGeom.Sphere.define(stage, path: "/Hello/World")

    stage.getPseudoRoot().set(doc: "Hello World Example (Swift)!")

    stage.save()
  }
}
