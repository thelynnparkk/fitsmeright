//
//  UIWindow+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation
import UIKit



public extension UIWindow {
  
}



public extension UIWindow {
  
  public func set(with root: UIViewController, style: CATransition.Style? = nil, duration: CFTimeInterval = 0.3) {
    let previousViewController = rootViewController
    if let style = style {
      layer.add(CATransition(style: style, duration: duration), forKey: kCATransition)
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
  
  //  func set(rootViewController newRootViewController: UIViewController, withTransition transition: CATransition? = nil) {
  //    let previousViewController = rootViewController
  //    if let transition = transition {
  //      layer.add(transition, forKey: kCATransition)
  //    }
  //    rootViewController = newRootViewController
  //
  //    if UIView.areAnimationsEnabled {
  //      UIView.animate(withDuration: CATransaction.animationDuration()) {
  //        newRootViewController.setNeedsStatusBarAppearanceUpdate()
  //      }
  //    } else {
  //      newRootViewController.setNeedsStatusBarAppearanceUpdate()
  //    }
  //
  //    if let transitionViewClass = NSClassFromString("UITransitionView") {
  //      for subview in subviews where subview.isKind(of: transitionViewClass) {
  //        subview.removeFromSuperview()
  //      }
  //    }
  //
  //    if let previousViewController = previousViewController {
  //      previousViewController.dismiss(animated: false) {
  //        previousViewController.view.removeFromSuperview()
  //      }
  //    }
  //  }
  
}

