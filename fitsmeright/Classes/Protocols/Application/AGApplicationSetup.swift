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
