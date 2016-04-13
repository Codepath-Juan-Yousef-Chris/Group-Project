//
//  AppDelegate.swift
//  SFArtOpenings
//
//  Created by Yousef Kazerooni on 2/25/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse
import ParseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let todayNavigationController = storyboard.instantiateViewControllerWithIdentifier("receptionsNavigationController") as! UINavigationController
        let todayViewController = todayNavigationController.topViewController as! MainViewController
        todayViewController.parseClass = "Today"
        todayNavigationController.tabBarItem.title = "Today"
        todayNavigationController.tabBarItem.image = UIImage(named: "temp1")
        //todayNavigationController.tabBarItem.selectedImage = UIImage(named: "temp1")
        
        
        let upcomingNavigationController = storyboard.instantiateViewControllerWithIdentifier("receptionsNavigationController") as! UINavigationController
        let upcomingViewController = upcomingNavigationController.topViewController as! MainViewController
        upcomingViewController.parseClass = "Upcoming"
        upcomingNavigationController.tabBarItem.title = "Upcoming"
        upcomingNavigationController.tabBarItem.image = UIImage(named: "temp2")
        //upcomingNavigationController.tabBarItem.selectedImage = UIImage(named: "temp1")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [todayNavigationController, upcomingNavigationController]
        
        UITabBar.appearance().tintColor = UIColor(
            red: 0xc0/255,
            green: 0x29/255,
            blue: 0x42/255,
            alpha: 1.0)
        
        UITabBar.appearance().barTintColor = UIColor(
            red: 0xec/255,
            green: 0xd0/255,
            blue: 0x78/255,
            alpha: 0.5)

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "groupcpu"
                configuration.clientKey = "jjkdf893jlk7r4"
                configuration.server = "https://sf-art.herokuapp.com/parse"
            })
        )
        
        
        
//       //User Persistence
//        if PFUser.currentUser() != nil {
//              let user = PFUser.currentUser
//              print(user)
//        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

