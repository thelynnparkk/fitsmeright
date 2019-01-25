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
    setTitleColor(c_material.white, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_material.grey100, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_material.grey300, size: .less), for: .disabled)
  }
  
  func setupCancelLight() {
    
  }
  
  func setupOkDark() {
    setTitleColor(c_custom.peach, for: [])
    setTitleColor(c_material.white, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_material.grey100, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_material.grey300, size: .less), for: .disabled)
    
  }
  
  func setupOkLight() {
    
  }
  
}
