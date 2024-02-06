import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
   override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
     // YMKMapKit.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
      YMKMapKit.setApiKey("6105ed74-34fc-49fe-8e7b-d83e25683212") // Your generated API key
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
