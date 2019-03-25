//
//  AppDelegate.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import SwifterSwift
import IQKeyboardManagerSwift
import Firebase
import PopupDialog
import SwifterSwift
import Kingfisher



extension AppDelegate:
  UIApplicationDelegate,
  Preparable,
  Colorable
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
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  override init() {
    super.init()
    setupInit()
  }
  
  deinit {
    setupDeinit()
  }
  
  func setupInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    //    SwifterSwift.appVersion
//    UserDefaults.removeAll()
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  func setupPrepare() {
    
  }
  
  func setupDeinit() {
    
  }
  
  
  
  //MARK: - LifeCycle
  
  
  
  //MARK: - SetupView
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
    
    func setupCores(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
      //MARK: UIApplication
      
      
      
      //MARK: UIBarButtonItem
      let nb = UINavigationBar.appearance()
      nb.setupWith(content: .white, bg: c_custom.peach, isTranslucent: false)
      
      //MARK: UIBarButtonItem
      let bbi = UIBarButtonItem.appearance()
      bbi.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -300, vertical: 0.0), for: .default)
      
      //MARK: UITabBar
      let tb = UITabBar.appearance()
      tb.setupWith(content: .white, bg: c_custom.peach, isTranslucent: false)
      
      //MARK: UITextField
      let txt = UITextField.appearance()
      txt.setupDark()
      
      //MARK: UIBarItem
      //    let bi = UIBarItem.appearance()
    }
    
    func setupPods(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
      //MARK: Firebase
      FirebaseApp.configure()
      
      
      
      //MARK: IQKeyboardManagerSwift
      let iqkbm = IQKeyboardManager.shared
      iqkbm.enable = true
      iqkbm.placeholderFont = UIFont.preferredFont(forTextStyle: .body)
      iqkbm.shouldToolbarUsesTextFieldTintColor = true
      iqkbm.overrideKeyboardAppearance = true
      iqkbm.shouldResignOnTouchOutside = true
      iqkbm.toolbarDoneBarButtonItemText = "Done"
      //    iqkbm.toolbarManageBehaviour = .byPosition
      //    iqkbm.previousNextDisplayMode = .alwaysShow
      
      //    @objc public var toolbarTintColor : UIColor?
      //
      //    /**
      //     This is used for toolbar.barTintColor. Default is nil and uses white color.
      //     */
      //    @objc public var toolbarBarTintColor : UIColor?
      
      
      
      //MARK: PopupDialog
      let pddv = PopupDialogDefaultView.appearance()
      pddv.backgroundColor = .white
      //    pddv.titleFont = .boldSystemFont(ofSize: 14)
      //    pddv.titleColor = UIColor(white: 0.4, alpha: 1)
      //    pddv.titleTextAlignment = .center
      //    pddv.messageFont = .systemFont(ofSize: 14)
      //    pddv.messageColor = UIColor(white: 0.6, alpha: 1)
      //    pddv.messageTextAlignment = .center
      
      let pdcv = PopupDialogContainerView.appearance()
      pdcv.backgroundColor = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
      //    pdcv.cornerRadius = 2
      //    pdcv.shadowEnabled = true
      //    pdcv.shadowColor = c_material.grey300
      //    pdcv.shadowOpacity = 0.6
      //    pdcv.shadowRadius = 20
      //    pdcv.shadowOffset = CGSize(width: 0, height: 8)
      //    pdcv.shadowPath = CGPath(...)
      
      let pdov = PopupDialogOverlayView.appearance()
      pdov.color = .black
      //    pdov.blurRadius = 20
      //    pdov.blurEnabled = true
      //    pdov.liveBlurEnabled = false
      //    pdov.opacity = 0.7
      
      let db = DefaultButton.appearance()
      db.titleFont = .systemFont(ofSize: 14)
      //    db.titleColor = UIColor(red: 0.25, green: 0.53, blue: 0.91, alpha: 1)
      //    db.buttonColor = .clear
      //    db.separatorColor = UIColor(white: 0.9, alpha: 1)
      
      let cb = CancelButton.appearance()
      cb.titleFont = .systemFont(ofSize: 14)
      //    cb.titleColor = UIColor(red: 0.25, green: 0.53, blue: 0.91, alpha: 1)
      //    cb.buttonColor = .clear
      //    cb.separatorColor = UIColor(white: 0.9, alpha: 1)
      
      
      
      //MARK: Kingfisher
      let kf = KingfisherManager.shared
      kf.defaultOptions = [.transition(.fade(1))]
      // Limit memory cache size to 300 MB.
      kf.cache.memoryStorage.config.totalCostLimit = 300 * 1024 * 1024
      // Limit memory cache to hold 150 images at most.
      kf.cache.diskStorage.config.expiration = .seconds(1000 * 1024 * 1024)
      kf.cache.diskStorage.config.sizeLimit = 600
      
    }
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    setupCores(with: app, options: options)
    setupPods(with: app, options: options)
    
  }
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - UIApplicationDelegate
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupOnDidFinishLaunching(with: application, options: launchOptions)
    route(with: launchOptions)
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
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  

}



