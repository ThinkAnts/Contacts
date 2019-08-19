//
//  AppDelegate.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "GoJekContacts")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

//extension UIColor {
//    public convenience init?(hex: String) {
//        let red, green, blue, alpha: CGFloat
//        
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//            
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//                
//                if scanner.scanHexInt64(&hexNumber) {
//                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    green = CGFloat((hexNumber & 0xff000000) >> 16) / 255
//                    blue = CGFloat((hexNumber & 0xff000000) >> 8) / 255
//                    alpha = CGFloat(hexNumber & 0xff000000) / 255
//                    
//                    self.init(red: red, green: green, blue: blue, alpha: alpha)
//                    return
//                }
//            }
//            
//        }
//        return nil
//    }
//}
