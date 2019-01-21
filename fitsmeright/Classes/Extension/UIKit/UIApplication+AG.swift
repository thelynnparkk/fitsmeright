//
//  UIApplication+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit


extension UIApplication {
  
  var statusBarView: UIView? {
    return value(forKey: "statusBar") as? UIView
  }
  
}
