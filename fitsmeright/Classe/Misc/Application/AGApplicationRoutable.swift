//
//  AGApplicationRoutable.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



protocol AGApplicationRoutable: AGApplicationWindow {
  func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?, condition isLoggedIn: Bool)
  func start(with app: UIApplication, url: URL, options: [UIApplication.OpenURLOptionsKey : Any], condition isLoggedIn: Bool) -> Bool
  func receiveCommon()
  func receiveDeeplink()
  func reviceNotification()
}



extension AGApplicationRoutable {

  //MARK: - Implements
  func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?, condition isLoggedIn: Bool) {
    window?.makeKeyAndVisible()
    let vc = SplashVC.vc
    vc.launchOptions = launchOptions
    window?.set(with: vc, style: .fade)
//    window?.switchRootViewController(to: vc, animated: true)
  }
  
  func start(with app: UIApplication, url: URL, options: [UIApplication.OpenURLOptionsKey : Any], condition isLoggedIn: Bool) -> Bool {
    guard let scheme = url.scheme else {
      return false
    }
    if scheme.isEqual("") {
      return false
    }
    //    if SDKApplicationDelegate.shared.application(app, open: url, options: options) {
    //      return true
    //    }
    //    if GIDSignIn.sharedInstance().handle(url, sourceApplication: options[.sourceApplication] as? String, annotation: [:]) {
    //      return true
    //    }
    //Handle Deeplink
    return false
  }
  
  func receiveCommon() {
    
  }
  
  func receiveDeeplink() {
    
  }
  
  func reviceNotification() {
    
  }
  

  
  //MARK: - Commons
  
  
  
  //MARK: - Scences

  
  
}

