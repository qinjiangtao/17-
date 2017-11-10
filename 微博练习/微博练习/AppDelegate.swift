//
//  AppDelegate.swift
//  微博练习
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = QJTMainViewController()
        window?.makeKeyAndVisible()
        
        
        
        
        
        
        
        return true
    }

    


}

