//
//  AppDelegate.swift
//  JPushSwiftDemo
//
//  Created by oshumini on 16/3/11.
//  Copyright © 2016年 HXHG. All rights reserved.
//

import UIKit
import UserNotifications
import TSToast


let appKey = "f4b07ac1a3b0e9ada59b8b9a"
let channel = "Publish channel"
let isProduction = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, JPUSHRegisterDelegate {
    
    var window: UIWindow?
    
    
    var blockFinishRegisToken:(()->Void)?
    struct Static {
        static var instance: AppDelegate?
    }
    class var ShareInstance: AppDelegate {
        if Static.instance == nil {
            Static.instance = AppDelegate()
        }
        return Static.instance!
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //    let entity = JPUSHRegisterEntity()
        
        if #available(iOS 10, *) {
            let entity = JPUSHRegisterEntity()
            entity.types = NSInteger(UNAuthorizationOptions.alert.rawValue) |
                NSInteger(UNAuthorizationOptions.sound.rawValue) |
                NSInteger(UNAuthorizationOptions.badge.rawValue)
            JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
            
        } else if #available(iOS 8, *) {
            // 可以自定义 categories
            JPUSHService.register(
                forRemoteNotificationTypes: UIUserNotificationType.badge.rawValue |
                    UIUserNotificationType.sound.rawValue |
                    UIUserNotificationType.alert.rawValue,
                categories: nil)
        } else {
            // ios 8 以前 categories 必须为nil
            JPUSHService.register(
                forRemoteNotificationTypes: UIRemoteNotificationType.badge.rawValue |
                    UIRemoteNotificationType.sound.rawValue |
                    UIRemoteNotificationType.alert.rawValue,
                categories: nil)
        }
        
        JPUSHService.setup(withOption: launchOptions, appKey: appKey, channel: channel, apsForProduction: isProduction)
        
        
        let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil )
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)

        let isFirtLogin = UserDefaults.bool(forKey: "isFirtKey")
        
        if !isFirtLogin {
            //UserDefaults.set(true, forKey: "isFirtKey")
            
            var rankings:String = "00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0|00:00:00 00:00 + 0"
            var arrayRankings:[String] = []
            for i in 0..<10
            {
                
                if i/2 == 0 {
                    
                    rankings.append("00:00:00 00:00")
                } else {
                    
                    rankings.append("0")
                }
            }
            
            UserDefaults.setValue(rankings, forKey: "LISTRANKING")
            UserDefaults.synchronize()
            let viewRootView = AVTutorialViewController()
            window?.rootViewController = viewRootView
            
        } else {
            let viewRootView = MenuViewController()
            let navVC = UINavigationController(rootViewController: viewRootView)
            window?.rootViewController = navVC
        }
        

        
        return true
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        
       // let userInfo = response.notification.request.content.userInfo
        //let request = response.notification.request // 收到推送的请求
        // let content = request.content // 收到推送的消息内容
        //
       // let badge = content.badge // 推送消息的角标
        // let body = content.body   // 推送消息体
        //    let sound = content.sound // 推送消息的声音
        //    let subtitle = content.subtitle // 推送消息的副标题
        //    let title = content.title // 推送消息的标题
        
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!,
        withCompletionHandler completionHandler: ((Int) -> Void)!) {
        //let userInfo = notification.request.content.userInfo
        
        //let request = notification.request // 收到推送的请求
        //let content = request.content // 收到推送的消息内容
        
       // let badge = content.badge // 推送消息的角标
       // let body = content.body   // 推送消息体
       // let sound = content.sound // 推送消息的声音
       // let subtitle = content.subtitle // 推送消息的副标题
       // let title = content.title // 推送消息的标题
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
        application.cancelAllLocalNotifications()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("get the deviceToken  \(deviceToken)")
       
//        self.showToast(message: "\(deviceToken)")
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "DidRegisterRemoteNotification"), object: deviceToken)
        JPUSHService.registerDeviceToken(deviceToken)
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("did fail to register for remote notification with error ", error)
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
       JPUSHService.handleRemoteNotification(userInfo)
        print("受到通知", userInfo)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "AddNotificationCount"), object: nil)  //把  要addnotificationcount
        //self.AlerNotification(userInfor: userInfo)
        
    }
    func showToast(message:String) {
        let topWindow = UIWindow(frame: UIScreen.main.bounds)
        topWindow.rootViewController = UIViewController()
        topWindow.windowLevel = UIWindowLevelAlert + 1
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "confirm"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            // continue your work
            // important to hide the window after work completed.
            // this also keeps a reference to the window until the action is invoked.
            topWindow.isHidden = true
        }))
        topWindow.makeKeyAndVisible()
        topWindow.rootViewController?.present(alert, animated: true, completion: { _ in })
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        JPUSHService.showLocalNotification(atFront: notification, identifierKey: nil)
    }
    
    @available(iOS 7, *)
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        
    }
    
    @available(iOS 7, *)
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
    }
    
    @available(iOS 7, *)
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable: Any], withResponseInfo responseInfo: [AnyHashable: Any], completionHandler: @escaping () -> Void) {
        
    }
    
    
    
}

