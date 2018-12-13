//
//  UIWindow+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



public extension UIWindow {
  
}



public extension UIWindow {
  
  public func set(with root: UIViewController, transition: CATransition? = nil) {
    let previousViewController = rootViewController
    if let t = transition {
      layer.add(t, forKey: kCATransition)
    }
    rootViewController = root
    
    if UIView.areAnimationsEnabled {
      UIView.animate(withDuration: CATransaction.animationDuration()) {
        root.setNeedsStatusBarAppearanceUpdate()
      }
    } else {
      root.setNeedsStatusBarAppearanceUpdate()
    }
    
    
    if let transitionViewClass = NSClassFromString("UITransitionView") {
      for subview in subviews where subview.isKind(of: transitionViewClass) {
        subview.removeFromSuperview()
      }
    }
    
    if let previousViewController = previousViewController {
      previousViewController.dismiss(animated: false) {
        previousViewController.view.removeFromSuperview()
      }
    }
  }
  
}
