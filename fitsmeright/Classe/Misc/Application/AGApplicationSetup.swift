//
//  AGApplicationSetup.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SwifterSwift
import IQKeyboardManagerSwift
import Firebase
import PopupDialog
import SwifterSwift
import Kingfisher



protocol AGApplicationSetup: Colorable {
  func setupOnInit()
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?)
  func setupOnDeinit()
}



extension AGApplicationSetup {
  
  func setupOnInit() {
    
//    SwifterSwift.appVersion
//    FMUserDefaults.removeAll()
    let fsUser = FSUser()
    fsUser.documentId = "N5GUixP95dAMKzXBx5kG"
    //    fsUser.documentId = "VceACbsT1S2QPNV3JQS7"
    fsUser.email = "lhnkki@gmail.com"
    fsUser.username = "lin999"
    fsUser.displayName = "linping"
    fsUser.password = "1234"
    fsUser.bio = "hi it's me"
    FMUserDefaults.FSUserDefault.set(data: fsUser)
  }
  
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
    setupCores(with: app, options: options)
    setupPods(with: app, options: options)
  }
  
  func setupOnDeinit() {
    
  }
  
}



extension AGApplicationSetup {

  //MARK: - Public
  
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core Setups
  private func setupCores(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
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
  
  //MARK: - Pod Setups
  private func setupPods(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
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
    pdov.color = c_material.grey300
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
  
}
