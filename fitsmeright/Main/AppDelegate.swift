//
//  AppDelegate.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension AppDelegate:
  UIApplicationDelegate,
  AGApplicationSetup,
  AGApplicationRoutable
{ }



@UIApplicationMain
class AppDelegate: UIResponder {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var window: UIWindow?
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  static var app_delegate: UIApplicationDelegate? {
    return UIApplication.shared.delegate
  }
  
  static var window: UIWindow? {
    return app_delegate?.window ?? nil
  }
  
  override init() {
    window = UIWindow(frame: UIScreen.main.bounds)
    super.init()
    setupOnInit()
  }
  
  deinit {
    setupOnDeinit()
  }
  
  
  
  //MARK: - Core - UIApplicationDelegate
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupOnDidFinishLaunching(with: application, options: launchOptions)
    start(with: launchOptions, condition: FMUserDefaults.LoggedIn.get() ?? false)
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
  
}



