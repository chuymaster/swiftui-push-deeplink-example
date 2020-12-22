import SwiftUI

@main
struct DeeplinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private var screenCoordinator = ScreenCoordinator()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(screenCoordinator)
        }
    }
}
