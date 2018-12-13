//
//  AGApplicationSetup.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import IQKeyboardManagerSwift



protocol AGApplicationSetup {
  func setupOnInit()
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?)
  func setupOnDeinit()
}



extension AGApplicationSetup {
  
  func setupOnInit() {
    
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
    setupAppearances()
    setupUserDefaults()
  }
  
  private func setupAppearances() {
    let c = R.Value.Color.self
    
    let nb = UINavigationBar.appearance()
    nb.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    //MARK: - UIBarButtonItem
    let bbi = UIBarButtonItem.appearance()
    bbi.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -300, vertical: 0.0), for: .default)
    
    //MARK: - UITabBar
    let tb = UITabBar.appearance()
    tb.setupWith(content: .white, bg: c.peach, isTranslucent: false)
  }
  
  private func setupUserDefaults() {
    
  }
  
  //MARK: - Pod Setups
  private func setupPods(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
    setupIQKeyboardManagerSwift()
  }
  
  private func setupIQKeyboardManagerSwift() {
    let iqkbm = IQKeyboardManager.shared
    iqkbm.enable = true
    iqkbm.placeholderFont = UIFont.preferredFont(forTextStyle: .body)
  }
  
}
