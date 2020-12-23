import SwiftUI

@main
struct DeeplinkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ScreenCoordinator())
        }
    }
}
