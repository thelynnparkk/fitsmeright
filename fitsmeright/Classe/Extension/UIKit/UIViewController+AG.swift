//
//  UIViewController+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



//MARK: - Flow control
public extension UIViewController {
  
  public func present(_ viewControllerToPresent: UIViewController, transition: CATransition? = nil, completion: CBVoid? = nil) {
    if let t = transition {
      view.window?.layer.add(t, forKey: nil)
    }
    present(viewControllerToPresent, animated: false, completion: completion)
  }
  
  public func dismiss(transition: CATransition? = nil, completion: CBVoid? = nil) {
    if let t = transition {
      view.window?.layer.add(t, forKey: nil)
    }
    dismiss(animated: false, completion: completion)
  }
  
}
