import SwiftUI

@main
struct DeeplinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var screenCoordinator = ScreenCoordinator()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(screenCoordinator)
        }
    }
}
