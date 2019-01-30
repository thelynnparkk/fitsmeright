//
//  UITextField+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 25/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension UITextField: Colorable {
  
  func setupDark() {
    textColor = c_material.grey500
    tintColor = c_custom.peach
    setPlaceHolderTextColor(c_material.grey300)
  }
  
  func setupLight() {
    
  }
  
  func setupCancelDark() {
    
  }
  
  func setupCancelLight() {
    
  }
  
}



extension UITextField {
  
  func setupStyleDefault() {
    clearsOnBeginEditing = false
    keyboardType = .default
    clearButtonMode = .whileEditing
  }
  
  func setupStyleEmail() {
    textContentType = .emailAddress
    keyboardType = .emailAddress
    clearButtonMode = .whileEditing
  }
  
  func setupStylePhone() {
    textContentType = .telephoneNumber
    keyboardType = .phonePad
  }
  
  func setupStylePassword() {
    clearButtonMode = .whileEditing
    textContentType = .password
    keyboardType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = true
    clearsOnBeginEditing = false
  }
  
  func setupStyleNumber() {
    keyboardType = .numberPad
  }
  
  func setupStyleOneTimeCode() {
    if #available(iOS 12.0, *) {
      textContentType = .oneTimeCode
    } else {
      
    }
    keyboardType = .numberPad
  }
  
}
