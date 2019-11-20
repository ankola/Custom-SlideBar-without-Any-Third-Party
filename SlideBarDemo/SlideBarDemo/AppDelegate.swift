//
//  AppDelegate.swift
//  SlideBarDemo
//
//  Created by ankola on 19/11/19.
//  Copyright © 2019 ankola. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
        var myDeviceToken = String()

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
                self.window = UIWindow(frame: UIScreen.main.bounds)
                let appdele = FirstVC.init(nibName: "FirstVC", bundle: nil)
                let rootvc = UINavigationController.init(rootViewController: appdele)
                self.window?.rootViewController = rootvc
                self.window?.makeKeyAndVisible()
                let navigationController = application.windows[0].rootViewController as! UINavigationController
                navigationController.isNavigationBarHidden = true
            
            return true
        }
        
      
        func applicationWillResignActive(_ application: UIApplication) {

        }

        func applicationDidEnterBackground(_ application: UIApplication) {
        }

        func applicationWillEnterForeground(_ application: UIApplication) {
        }

        func applicationDidBecomeActive(_ application: UIApplication) {
        }

        func applicationWillTerminate(_ application: UIApplication) {
        }


    }

