import SwiftUI
import Flutter

struct ContentView: View {
  // Flutter dependencies are passed in an EnvironmentObject.
  @EnvironmentObject var flutterDependencies: FlutterDependencies

  // Button is created to call the showFlutter function when pressed.
  var body: some View {
    Button("Show Flutter!") {
      showFlutter()
    }
  }

func showFlutter() {
    // Get the RootViewController.
    guard
      let windowScene = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
      let window = windowScene.windows.first(where: \.isKeyWindow),
      let rootViewController = window.rootViewController
    else { return }

    // Create the FlutterViewController.
    let flutterViewController = FlutterViewController(
      engine: flutterDependencies.flutterEngine,
      nibName: nil,
      bundle: nil)
    flutterViewController.modalPresentationStyle = .overCurrentContext
    flutterViewController.isViewOpaque = false

    rootViewController.present(flutterViewController, animated: true)
  }
}
