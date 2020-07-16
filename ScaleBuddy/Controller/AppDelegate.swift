//
//  AppDelegate.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 04/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let path: [AnyObject] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) as [AnyObject]
        let folder: String = path[0] as! String
        NSLog("Your NSUserDefaults are stored in this folder: %@/Preferences", folder)
        
        
        let initialVC = appPreviouslyLaunched()
        
        if initialVC == true {
            print("initial VC = choose")
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//            let initialViewController = storyboard.instantiateViewController(withIdentifier: "ChooseViewController")
//
//            self.window?.rootViewController = initialViewController
//            self.window?.makeKeyAndVisible()
            
        } else {
            print("initial VC = grade")
    
            createGrades()
            
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//            let initialViewController = storyboard.instantiateViewController(withIdentifier: "GradeTableViewController")
//
//            self.window?.rootViewController = initialViewController
//            self.window?.makeKeyAndVisible()
            
        }


//                let scale = Scale(key: 0, tonality: 0, octaves: 0, style: 0)
//
//                do {
//                    let realm = try Realm()
//                    try realm.write {
//                        realm.add(scale)
//                    }
//                } catch {
//                    print("Error initialising new Realm, \(error)")
//                }
        
        return true
        
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

    
    func appPreviouslyLaunched() -> Bool {
        
        let userInfo = UserDefaults.standard
        let launched = "appPreviouslyLaunched"
        
        if let _ = userInfo.string(forKey: launched) {
            print("App already launched")
            return true
            
        } else {
            userInfo.set(true, forKey: launched)
            print("App launched first time")
            return false
        }
    }
    
    func createGrades() {
        
        let grade1 = Grade()
        let grade2 = Grade()
        let grade3 = Grade()
        let grade4 = Grade()
        let grade5 = Grade()
        let grade6 = Grade()
        let grade7 = Grade()
        let grade8 = Grade()
        
        //GRADE 1
        
        for i in 0...1 {
            // majors
            grade1.addScale(key: 5, tonality: 0, octaves: 0, style: i)
            grade1.addScale(key: 6, tonality: 0, octaves: 0, style: i)
            grade1.addScale(key: 7, tonality: 0, octaves: 0, style: i)
            grade1.addScale(key: 8, tonality: 0, octaves: 0, style: i)
            grade1.addScale(key: 9, tonality: 0, octaves: 0, style: i)
            grade1.addArpeggio(key: 5, tonality: 0, octaves: 0, style: i, inversion: 0, type: 0)
            grade1.addArpeggio(key: 6, tonality: 0, octaves: 0, style: i, inversion: 0, type: 0)
            grade1.addArpeggio(key: 7, tonality: 0, octaves: 0, style: i, inversion: 0, type: 0)
            grade1.addArpeggio(key: 8, tonality: 0, octaves: 0, style: i, inversion: 0, type: 0)
            grade1.addArpeggio(key: 9, tonality: 0, octaves: 0, style: i, inversion: 0, type: 0)
            
        }
        
        //GRADE 2
        
        for i in 0...2 {
            // majors
            grade2.addScale(key: 5, tonality: 0, octaves: 1, style: i)
            grade2.addScale(key: 6, tonality: 0, octaves: 1, style: i)
            grade2.addScale(key: 7, tonality: 0, octaves: 1, style: i)
            grade2.addScale(key: 8, tonality: 0, octaves: 1, style: i)
            grade2.addScale(key: 9, tonality: 0, octaves: 1, style: i)
            grade2.addArpeggio(key: 5, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 6, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 7, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 8, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 9, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            
            // minors
            grade2.addScale(key: 9, tonality: 1, octaves: 1, style: i)
            grade2.addScale(key: 10, tonality: 1, octaves: 1, style: i)
            grade2.addScale(key: 11, tonality: 1, octaves: 1, style: i)
            grade2.addArpeggio(key: 9, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 10, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade2.addArpeggio(key: 11, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
        }
        
        //GRADE 3
        
        for i in 0...2 {
            // majors
            grade3.addScale(key: 4, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 5, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 6, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 7, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 8, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 9, tonality: 0, octaves: 1, style: i)
            grade3.addScale(key: 10, tonality: 0, octaves: 1, style: i)
            grade3.addArpeggio(key: 4, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 5, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 6, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 7, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 8, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 9, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 10, tonality: 0, octaves: 1, style: i, inversion: 0, type: 0)
            
            // minors
            grade3.addScale(key: 7, tonality: 1, octaves: 1, style: i)
            grade3.addScale(key: 8, tonality: 1, octaves: 1, style: i)
            grade3.addScale(key: 9, tonality: 1, octaves: 1, style: i)
            grade3.addScale(key: 10, tonality: 1, octaves: 1, style: i)
            grade3.addScale(key: 11, tonality: 1, octaves: 1, style: i)
            grade3.addArpeggio(key: 7, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 8, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 9, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 10, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
            grade3.addArpeggio(key: 11, tonality: 1, octaves: 1, style: i, inversion: 0, type: 0)
        }
        
        // arps divided major
        grade3.addArpeggio(key: 4, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 5, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 6, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 7, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 8, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 9, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 10, tonality: 0, octaves: 2, style: 8, inversion: 0, type: 0)
        // arps divided minor
        grade3.addArpeggio(key: 7, tonality: 1, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 8, tonality: 1, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 9, tonality: 1, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 10, tonality: 1, octaves: 2, style: 8, inversion: 0, type: 0)
        grade3.addArpeggio(key: 11, tonality: 1, octaves: 2, style: 8, inversion: 0, type: 0)
        
        //GRADE 4
        
        for i in 0...2 {
            // majors
            grade4.addScale(key: 3, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 4, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 5, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 6, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 7, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 8, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 9, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 10, tonality: 0, octaves: 2, style: i)
            grade4.addScale(key: 11, tonality: 0, octaves: 2, style: i)
            
            // minors
            grade4.addScale(key: 6, tonality: 1, octaves: 2, style: i)
            grade4.addScale(key: 7, tonality: 1, octaves: 2, style: i)
            grade4.addScale(key: 8, tonality: 1, octaves: 2, style: i)
            grade4.addScale(key: 9, tonality: 1, octaves: 2, style: i)
            grade4.addScale(key: 10, tonality: 1, octaves: 2, style: i)
            grade4.addScale(key: 11, tonality: 1, octaves: 2, style: i)
            
            // melodic minors
            grade4.addScale(key: 6, tonality: 2, octaves: 2, style: i)
            grade4.addScale(key: 7, tonality: 2, octaves: 2, style: i)
            
            for x in 0...1 {
                // arpeggios major
                grade4.addArpeggio(key: 3, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 4, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 5, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 6, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 7, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 8, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 9, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 10, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 11, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                // arpeggios minor
                grade4.addArpeggio(key: 6, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 7, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 8, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 9, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 10, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade4.addArpeggio(key: 11, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
            }
            
        }
        
        for i in 0...1 {
            // arps divided major
            grade4.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided minor
            grade4.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade4.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
        }
        
        
        //GRADE 5
        
        for i in 0...2 {
            // majors
            grade5.addScale(key: 0, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 1, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 2, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 3, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 4, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 5, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 6, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 7, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 8, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 9, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 10, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 11, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 12, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 13, tonality: 0, octaves: 2, style: i)
            grade5.addScale(key: 14, tonality: 0, octaves: 2, style: i)
            
            // minors
            grade5.addScale(key: 3, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 4, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 5, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 6, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 7, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 8, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 9, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 10, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 11, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 12, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 13, tonality: 1, octaves: 2, style: i)
            grade5.addScale(key: 14, tonality: 1, octaves: 2, style: i)
            
            // melodic minors
            grade5.addScale(key: 3, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 4, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 5, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 6, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 7, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 8, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 9, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 10, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 11, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 12, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 13, tonality: 2, octaves: 2, style: i)
            grade5.addScale(key: 14, tonality: 2, octaves: 2, style: i)
            
            for x in 0...1 {
                // arpeggios major
                grade5.addArpeggio(key: 0, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 1, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 2, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 3, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 4, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 5, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 8, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 9, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 10, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 11, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 12, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 13, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 14, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                // arpeggios minor
                grade5.addArpeggio(key: 3, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 4, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 5, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 8, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 9, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 10, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 11, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 12, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 13, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 14, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
            }
            
            for x in 0...2 {
                // arps with 2nd inversion major
                grade5.addArpeggio(key: 6, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 7, tonality: 0, octaves: 2, style: i, inversion: x, type: 0)
                // arps with 2nd inversion major
                grade5.addArpeggio(key: 6, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
                grade5.addArpeggio(key: 7, tonality: 1, octaves: 2, style: i, inversion: x, type: 0)
            }
            
        }
        
        for i in 0...1 {
            // arps divided major
            grade5.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided minor
            
            grade5.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 12, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 13, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 14, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
        }
        
        for i in 0...2 {
            // arps divided with 2nd inversion major
            grade5.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided with 2nd inversion major
            grade5.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade5.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            
        }
        
        for i in 0...2 {
            // dom 7ths
            grade5.addArpeggio(key: 5, tonality: 0, octaves: 2, style: i, inversion: 0, type: 1)
            grade5.addArpeggio(key: 6, tonality: 0, octaves: 2, style: i, inversion: 0, type: 1)
            grade5.addArpeggio(key: 7, tonality: 0, octaves: 2, style: i, inversion: 0, type: 1)
            grade5.addArpeggio(key: 8, tonality: 0, octaves: 2, style: i, inversion: 0, type: 1)
        }
        
        // dom 7ths divided
        grade5.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: 0, type: 1)
        grade5.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: 0, type: 1)
        grade5.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: 0, type: 1)
        grade5.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: 0, type: 1)
        
        //GRADE 6
        
        for i in 0...3 {
            // majors
            grade6.addScale(key: 0, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 1, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 2, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 3, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 4, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 5, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 6, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 7, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 8, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 9, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 10, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 11, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 12, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 13, tonality: 0, octaves: 3, style: i)
            grade6.addScale(key: 14, tonality: 0, octaves: 3, style: i)
            
            // minors
            grade6.addScale(key: 3, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 4, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 5, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 6, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 7, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 8, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 9, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 10, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 11, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 12, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 13, tonality: 1, octaves: 3, style: i)
            grade6.addScale(key: 14, tonality: 1, octaves: 3, style: i)
            
            // melodic minors
            grade6.addScale(key: 3, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 4, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 5, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 6, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 7, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 8, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 9, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 10, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 11, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 12, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 13, tonality: 2, octaves: 3, style: i)
            grade6.addScale(key: 14, tonality: 2, octaves: 3, style: i)
            
            for x in 0...2 {
                // arpeggios major
                grade6.addArpeggio(key: 0, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 1, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 2, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 3, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 4, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 5, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 6, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 7, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 8, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 9, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 10, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 11, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                // arpeggios minor
                grade6.addArpeggio(key: 3, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 4, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 5, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 6, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 7, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 8, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 9, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 10, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 11, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 12, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 13, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade6.addArpeggio(key: 14, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
            }
        }
        
        for i in 0...2 {
            // arps divided major
            grade6.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided minor
            grade6.addArpeggio(key: 3, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 4, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 5, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 12, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 13, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade6.addArpeggio(key: 14, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
        }
        
        for i in 0...2 {
            for x in 0...1 {
                // dom 7ths
                grade6.addArpeggio(key: 0, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 1, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 2, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 3, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 4, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 5, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 6, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 7, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 8, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 9, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 10, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 11, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 12, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 13, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
                grade6.addArpeggio(key: 14, tonality: 0, octaves: 2, style: i, inversion: x, type: 1)
            }
        }
        
        for x in 0...1 {
            // dom 7ths divided
            grade6.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade6.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
        }
        
        
        //GRADE 7
        
        for i in 0...4 {
            // majors
            grade7.addScale(key: 0, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 1, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 2, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 3, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 4, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 5, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 6, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 7, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 8, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 9, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 10, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 11, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 12, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 13, tonality: 0, octaves: 3, style: i)
            grade7.addScale(key: 14, tonality: 0, octaves: 3, style: i)
            
            // minors
            grade7.addScale(key: 3, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 4, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 5, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 6, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 7, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 8, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 9, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 10, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 11, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 12, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 13, tonality: 1, octaves: 3, style: i)
            grade7.addScale(key: 14, tonality: 1, octaves: 3, style: i)
            
            // melodic minors
            grade7.addScale(key: 3, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 4, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 5, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 6, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 7, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 8, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 9, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 10, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 11, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 12, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 13, tonality: 2, octaves: 3, style: i)
            grade7.addScale(key: 14, tonality: 2, octaves: 3, style: i)
            
            for x in 0...2 {
                // arpeggios major
                grade7.addArpeggio(key: 0, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 1, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 2, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 3, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 4, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 5, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 6, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 7, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 8, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 9, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 10, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 11, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                // arpeggios minor
                grade7.addArpeggio(key: 3, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 4, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 5, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 6, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 7, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 8, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 9, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 10, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 11, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 12, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 13, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade7.addArpeggio(key: 14, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
            }
        }
        
        for i in 0...2 {
            // arps divided major
            grade7.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided minor
            grade7.addArpeggio(key: 3, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 4, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 5, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 12, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 13, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade7.addArpeggio(key: 14, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
        }
        
        // contrary motion majors
        grade7.addScale(key: 0, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 1, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 2, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 3, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 4, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 5, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 6, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 7, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 8, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 9, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 10, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 11, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 12, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 13, tonality: 0, octaves: 1, style: 5)
        grade7.addScale(key: 14, tonality: 0, octaves: 1, style: 5)
        
        // contrary motion minors
        grade7.addScale(key: 3, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 4, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 5, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 6, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 7, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 8, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 9, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 10, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 11, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 12, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 13, tonality: 1, octaves: 1, style: 5)
        grade7.addScale(key: 14, tonality: 1, octaves: 1, style: 5)
        
        for i in 0...2 {
            for x in 0...2 {
                // dom 7ths
                grade7.addArpeggio(key: 0, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 1, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 2, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 3, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 4, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 5, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 6, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 7, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 8, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 9, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 10, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 11, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 12, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 13, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade7.addArpeggio(key: 14, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
            }
        }
        
        for x in 0...2 {
            // dom 7ths divided
            grade7.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade7.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
        }
        
        // dom 7ths narrow position
        grade7.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade7.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        
        //GRADE 8
        
        for i in 0...4 {
            // majors
            grade8.addScale(key: 0, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 1, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 2, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 3, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 4, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 5, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 6, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 7, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 8, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 9, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 10, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 11, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 12, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 13, tonality: 0, octaves: 3, style: i)
            grade8.addScale(key: 14, tonality: 0, octaves: 3, style: i)
            
            // minors
            grade8.addScale(key: 3, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 4, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 5, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 6, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 7, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 8, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 9, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 10, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 11, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 12, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 13, tonality: 1, octaves: 3, style: i)
            grade8.addScale(key: 14, tonality: 1, octaves: 3, style: i)
            
            // melodic minors
            grade8.addScale(key: 3, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 4, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 5, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 6, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 7, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 8, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 9, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 10, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 11, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 12, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 13, tonality: 2, octaves: 3, style: i)
            grade8.addScale(key: 14, tonality: 2, octaves: 3, style: i)
            
            for x in 0...2 {
                // arpeggios major
                grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: i, inversion: x, type: 0)
                // arpeggios minor
                grade8.addArpeggio(key: 3, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 4, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 5, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 6, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 7, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 8, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 9, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 10, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 11, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 12, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 13, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
                grade8.addArpeggio(key: 14, tonality: 1, octaves: 3, style: i, inversion: x, type: 0)
            }
        }
        
        
        for i in 0...2 {
            // arps divided major
            grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: i, type: 0)
            // arps divided minor
            grade8.addArpeggio(key: 3, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 4, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 5, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 12, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 13, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
            grade8.addArpeggio(key: 14, tonality: 1, octaves: 3, style: 8, inversion: i, type: 0)
        }
        
        // arps narrow position major
        grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 0)
        // arps narrow position minor
        grade8.addArpeggio(key: 3, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 4, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 5, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 6, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 7, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 8, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 9, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 10, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 11, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 12, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 13, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        grade8.addArpeggio(key: 14, tonality: 1, octaves: 3, style: 9, inversion: 0, type: 0)
        
        for i in 5...7 {
            // contrary motion majors
            grade8.addScale(key: 0, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 1, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 2, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 3, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 4, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 5, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 6, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 7, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 8, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 9, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 10, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 11, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 12, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 13, tonality: 0, octaves: 1, style: i)
            grade8.addScale(key: 14, tonality: 0, octaves: 1, style: i)
            
            // contrary motion minors
            grade8.addScale(key: 3, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 4, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 5, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 6, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 7, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 8, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 9, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 10, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 11, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 12, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 13, tonality: 1, octaves: 1, style: i)
            grade8.addScale(key: 14, tonality: 1, octaves: 1, style: i)
        }
        
        for i in 0...2 {
            for x in 0...3 {
                // dom 7ths
                grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 12, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 13, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
                grade8.addArpeggio(key: 14, tonality: 0, octaves: 3, style: i, inversion: x, type: 1)
            }
        }
        
        for x in 0...3 {
            // dom 7ths divided
            grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
            grade8.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 8, inversion: x, type: 1)
        }
        
        // dom 7ths narrow position
        grade8.addArpeggio(key: 0, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 1, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 2, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 3, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 4, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 5, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 6, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 7, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 8, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 9, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 10, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 11, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 12, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 13, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        grade8.addArpeggio(key: 14, tonality: 0, octaves: 3, style: 9, inversion: 0, type: 1)
        
        // dim 7ths
        for i in 0...2 {
            grade8.addArpeggio(key: 13, tonality: 3, octaves: 3, style: i, inversion: 0, type: 2)
            grade8.addArpeggio(key: 14, tonality: 3, octaves: 3, style: i, inversion: 0, type: 2)
            grade8.addArpeggio(key: 15, tonality: 3, octaves: 3, style: i, inversion: 0, type: 2)
        }
        
        //dim 7ths divided
        grade8.addArpeggio(key: 13, tonality: 3, octaves: 3, style: 8, inversion: 0, type: 2)
        grade8.addArpeggio(key: 14, tonality: 3, octaves: 3, style: 8, inversion: 0, type: 2)
        grade8.addArpeggio(key: 15, tonality: 3, octaves: 3, style: 8, inversion: 0, type: 2)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(grade1)
                realm.add(grade2)
                realm.add(grade3)
                realm.add(grade4)
                realm.add(grade5)
                realm.add(grade6)
                realm.add(grade7)
                realm.add(grade8)
            }
        } catch {
            print("Error initialising new Realm, \(error)")
        }

    }


}
