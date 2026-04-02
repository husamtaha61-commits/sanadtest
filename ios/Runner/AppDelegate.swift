import UIKit
import Flutter
import Firebase
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let channelName = "APNS_CHANNEL"
    var APNSChannel: FlutterMethodChannel?
    var flutterEngine: FlutterEngine?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        
        // This is required to make any communication available in the action isolate.
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }
        
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
//    override
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
//        let token = tokenParts.joined()
//        print("Device Token: \(token)")
//        
//        Messaging.messaging().apnsToken = deviceToken
//    }
    
    
    // Handle notification when app is in FOREGROUND
    override
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) ->Void) {
        
        var userInfo = notification.request.content.userInfo
        print("Received notification in foreground: \(notification.request)")
        
        // Check if this is a Twilio message
        if userInfo["twi_message_id"] != nil {
            // Initialize Flutter engine if app was terminated
            if self.flutterEngine == nil {
                self.flutterEngine = FlutterEngine(name: "background_engine")
                flutterEngine?.run()
            }
            
            let controller = window?.rootViewController as? FlutterViewController ??
                FlutterViewController(engine: flutterEngine!, nibName: nil, bundle: nil)
            
            // Create or reuse the channel
            if APNSChannel == nil {
                APNSChannel = FlutterMethodChannel(
                    name: channelName,
                    binaryMessenger: controller.binaryMessenger
                )
            }
            
            // Send the Twilio notification data to Flutter
            userInfo["twi_body"] = notification.request.content.body
            APNSChannel?.invokeMethod("IOSTwilioNewMessage", arguments: userInfo) { result in
                completionHandler([])
            }
        } else {
            // Not a Twilio message, let the system handle it
            completionHandler([.banner, .sound, .badge])
        }
    }
    
    override
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        
        print("DEBUGG Received notification in background new: \(userInfo)")
        
        // Check if this is a Twilio message
        if userInfo["twi_message_id"] != nil {
            // Initialize Flutter engine if app was terminated
            if self.flutterEngine == nil {
                self.flutterEngine = FlutterEngine(name: "background_engine")
                flutterEngine?.run()
            }
            
            let controller = window?.rootViewController as? FlutterViewController ??
                FlutterViewController(engine: flutterEngine!, nibName: nil, bundle: nil)
            
            // Create or reuse the channel
            if APNSChannel == nil {
                APNSChannel = FlutterMethodChannel(
                    name: channelName,
                    binaryMessenger: controller.binaryMessenger
                )
            }
            
            // Send the Twilio notification data to Flutter
//            userInfo["twi_body"] = response.notification.request.content.body
            APNSChannel?.invokeMethod("IOSTwilioNewMessageBackground", arguments: userInfo) { result in
                
                completionHandler(.newData)
                
            }
        } else {
            // Not a Twilio message, let the system handle it
            completionHandler(.newData)
        }
    }
}
