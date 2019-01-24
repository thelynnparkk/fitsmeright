//
//  UIButton+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension UIButton: Colorable {
  
  func setupDark() {
    setTitleColor(c_custom.peach, for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
  }
  
  func setupLight() {
    setBackgroundImage(UIImage(color: c_custom.peach, size: .less), for: [])
  }
  
  func setupCancelDark() {
    setTitleColor(c_custom.peach, for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
  }
  
  func setupCancelLight() {
    setBackgroundImage(UIImage(color: c_custom.peach, size: .less), for: [])
  }
  
}
