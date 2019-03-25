//
//  UIButton+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension UIButton {
  
  func setupDark() {
    setTitleColor(c_custom.peach, for: [])
    setTitleColor(c_custom.peachD, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
  }
  
  func setupLight() {
    setTitleColor(.white, for: [])
    setTitleColor(.white, for: .disabled)
    setBackgroundImage(UIImage(color: c_custom.peach, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_custom.peachD, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_material.grey300, size: .less), for: .disabled)
  }
  
  func setupCancelDark() {
    setTitleColor(c_custom.peach, for: [])
    setTitleColor(.white, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_material.grey100, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_material.grey300, size: .less), for: .disabled)
  }
  
  func setupCancelLight() {
    
  }
  
  func setupOkDark() {
    setTitleColor(c_custom.peach, for: [])
    setTitleColor(.white, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_material.grey100, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_material.grey300, size: .less), for: .disabled)
    
  }
  
  func setupOkLight() {
    
  }
  
  func setupBorderMonoDark() {
    
  }
  
  func setupBorderMonoLight() {
    setTitleColor(.black, for: [])
    setTitleColor(.black, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: .white, size: .less), for: .disabled)
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
  }
  
  func setupFacebookDark() {
    setTitleColor(c_social.facebook, for: [])
    setTitleColor(c_social.facebook, for: .disabled)
    setBackgroundImage(UIImage(color: .white, size: .less), for: [])
    setBackgroundImage(UIImage(color: .white, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: .white, size: .less), for: .disabled)
    layer.borderColor = c_social.facebook.cgColor
    layer.borderWidth = 1
  }
  
  func setupFacebookLight() {
    setTitleColor(.white, for: [])
    setTitleColor(.white, for: .disabled)
    setBackgroundImage(UIImage(color: c_social.facebook, size: .less), for: [])
    setBackgroundImage(UIImage(color: c_social.facebook, size: .less), for: .highlighted)
    setBackgroundImage(UIImage(color: c_social.facebook, size: .less), for: .disabled)
    layer.borderColor = c_social.facebook.cgColor
    layer.borderWidth = 1
  }
  
  func setupTextDark() {
    
  }
  
  func setupTextLight() {
    setTitleColor(c_material.grey500, for: [])
    setTitleColor(c_material.grey500, for: .disabled)
  }
  
}
