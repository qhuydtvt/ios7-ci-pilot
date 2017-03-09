//
//  AppDelegate.swift
//  SwiftLearning
//
//  Created by huynq on 2/26/17.
//  Copyright © 2017 techkidsvn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }
    
    func removeDictbyName(ArraySong:[[String:String]], name:String)->Array<Any>{
        var songs = ArraySong
        let songCount = songs.count
        for songIndex in 0...songCount-1 {
            if songs[songIndex]["Name"] == name {
                songs.remove(at: songIndex)
            }
        }
        
        return songs
    }

    
    func getMin(list: [Any], larger: (Any, Any) -> Bool) -> Any {
        var min = list[0]
        
        for i in 1..<list.count {
            if larger(min, list[i]) {
                min = list[i]
            }
        }
        
        return min
    }
    
    func changeList(myList: [String]) -> Void {
        var myList = myList
        myList.append("Hahaha")
    }
    
    func sayHello() -> Void {
        print("Hello")
    }
    
    func add(x: Int, y: Int) {
        print("\(x) + \(y) = \(x+y)")
    }
    
    func subtract(x: Int, y: Int) -> Int {
        return x - y
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

