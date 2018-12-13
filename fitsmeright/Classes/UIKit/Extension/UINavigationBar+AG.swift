//
//  UINavigationBar+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension UINavigationBar {
  
  private func setupStyle(content colorContent: UIColor, bg colorBG: UIColor, translucent: Bool, isLargeTitles: Bool = false) {
    barStyle = .default
    tintColor = colorContent
    barTintColor = colorBG
    backgroundColor = .clear
    isTranslucent = translucent
    if isTranslucent {
      //Custom view in storyboard
      setBackgroundImage(UIImage(), for: .default)
    } else {
      //Set color
      setBackgroundImage(UIImage.withColor(colorBG), for: .default)
    }
    let nb_titleTextAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 18),
      .foregroundColor: colorContent
    ]
    titleTextAttributes = nb_titleTextAttributes
    if isLargeTitles {
      prefersLargeTitles = true
      let nb_largeTitleTextAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 28),
        .foregroundColor: colorContent
      ]
      largeTitleTextAttributes = nb_largeTitleTextAttributes
    } else {
      prefersLargeTitles = false
    }
  }
  
  func setupWith(content colorContent: UIColor, bg colorBG: UIColor, isTranslucent: Bool) {
    setupStyle(content: colorContent, bg: colorBG, translucent: isTranslucent, isLargeTitles: false)
  }
  
  func setupLargeTitlesWith(content colorContent: UIColor, bg colorBG: UIColor) {
    setupStyle(content: colorContent, bg: colorBG, translucent: true, isLargeTitles: true)
  }
  
}
