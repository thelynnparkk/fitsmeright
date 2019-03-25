//
//  AppDelegate+Router.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension AppDelegate {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  func route(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    let vc = SplashVC.vc()
    vc.launchOptions = launchOptions
    window?.set(with: vc, style: .fade)
  }
  
  func route(with app: UIApplication, url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
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
  
  
  
  //MARK: - Private
  
}
