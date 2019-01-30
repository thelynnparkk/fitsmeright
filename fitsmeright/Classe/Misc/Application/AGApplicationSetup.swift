//
//  AGApplicationSetup.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import IQKeyboardManagerSwift
import Firebase



protocol AGApplicationSetup: Colorable {
  func setupOnInit()
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?)
  func setupOnDeinit()
}



extension AGApplicationSetup {
  
  func setupOnInit() {
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
    
  }
  
}
