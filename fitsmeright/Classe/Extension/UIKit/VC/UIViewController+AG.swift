//
//  UIViewController+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension UIViewController {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  func present(vc: UIViewController, transition: CATransition? = nil, completion: CBVoid? = nil) {
    if let t = transition {
      view.window?.layer.add(t, forKey: nil)
    }
    present(vc, animated: false, completion: completion)
  }
  
  func dismiss(transition: CATransition? = nil, completion: CBVoid? = nil) {
    if let t = transition {
      view.window?.layer.add(t, forKey: nil)
    }
    dismiss(animated: false, completion: completion)
  }
  
  
  
  //MARK: - Private
  
  
  
}



extension UIViewController {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  class var sb_name: String {
    return String(describing: self)
  }
  
  class var vc_name: String {
    return String(describing: self)
  }
  
  class func vc() -> Self {
    return instantiateFromStoryboardHelper()
  }
  
  
  
  //MARK: - Private
  fileprivate class var sb: UIStoryboard {
    return UIStoryboard(name: vc_name, bundle: nil)
  }
  
  fileprivate class func instantiateFromStoryboardHelper<T>() -> T {
    return sb.instantiateViewController(withIdentifier: vc_name) as! T
  }
  
}



extension UIViewController {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  @objc func popButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func dismissButtonPressed() {
    dismiss(animated: true)
  }
  
  @objc func backButtonPressed() {
    var isDismiss = false
    if let nav = navigationController {
      if nav.viewControllers.count > 1 {
        nav.popViewController(animated: true)
      } else {
        isDismiss = true
      }
    } else {
      isDismiss = true
    }
    if isDismiss {
      dismiss(animated: true)
    }
  }
  
  
  
  //MARK: - Private
  
  
  
}



extension UIViewController {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  private var app_delegate: UIApplicationDelegate? {
    return UIApplication.shared.delegate
  }
  var window: UIWindow? {
    return app_delegate?.window ?? nil
  }
  var ni: UINavigationItem {
    return navigationItem
  }
  var nvc: UINavigationController? {
    return navigationController
  }
  var nb: UINavigationBar? {
    return navigationController?.navigationBar
  }
  //  var tb: UITabBar {
  //    return tabBar
  //  }
  
  
  
  //MARK: - Private
  
  
  
}




extension UIViewController {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - LifeCycle
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

