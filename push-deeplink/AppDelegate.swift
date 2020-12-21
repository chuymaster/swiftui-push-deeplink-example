import Foundation
import NotificationCenter
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current()
          .requestAuthorization(options: [.alert, .sound, .badge]) { (granted, _) in
            print("Permission granted: \(granted)")
          }
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {

  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    guard let url = URL(string: "\(notification.request.content.userInfo["url"] ?? "")") else {
      return
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }

  public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    guard let url = URL(string: "\(response.notification.request.content.userInfo["url"] ?? "")") else {
      return
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
}
