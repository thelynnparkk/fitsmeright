//
//  UITabBar+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 11/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension UITabBar {
  
  private func setupStyle(content colorContent: UIColor, bg colorBG: UIColor, translucent: Bool) {
    barStyle = .default
    tintColor = colorContent
    barTintColor = colorBG
    unselectedItemTintColor = colorContent
    backgroundColor = .clear
    isTranslucent = translucent
    if isTranslucent {
      //Custom view in storyboard
      backgroundColor = .clear
    } else {
      //Set color
      backgroundColor = colorBG
    }
  }
  
  func setupWith(content colorContent: UIColor, bg colorBG: UIColor, isTranslucent: Bool) {
    setupStyle(content: colorContent, bg: colorBG, translucent: isTranslucent)
  }

}
