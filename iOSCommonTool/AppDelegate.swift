//
//  AppDelegate.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/11/24.
//

import UIKit
import AVFoundation
import Photos

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions!")
        print("NSHomeDirectory=\(NSHomeDirectory())")
        print("device-\(UIScreen.main)")
        let infoDic = Bundle.main.infoDictionary
        print("App---\(infoDic?["CFBundleIdentifier"])---\(infoDic?["CFBundleDisplayName"])---\(infoDic?["CFBundleName"])")
        
        #if DEBUG
        print("DEBUG!!!!")
        #else
        print("Release!!!!")
        #endif
        
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
                
            }
        } else {
            // Fallback on earlier versions
        }
        
        AVCaptureDevice.requestAccess(for: .video) { (isGranted) in
            
        }
        
        let backgroundTime = UserDefaults.standard.object(forKey: "preference_background_time")
        let sliderValue = UserDefaults.standard.object(forKey: "slider_preference")
        let enableValue = UserDefaults.standard.object(forKey: "enabled_preference")
        let nameValue = UserDefaults.standard.object(forKey: "name_preference")
        let versionValue = UserDefaults.standard.object(forKey: "preference_version")
        //UserDefaults.standard.setValue("1.1.1", forKey: "preference_version")
        //UserDefaults.standard.synchronize()
        UserDefaults.standard.removeObject(forKey: "preference_version")
        
        let groupValue = UserDefaults.standard.object(forKey: "preference_version")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    */


}

