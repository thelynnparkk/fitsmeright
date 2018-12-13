//
//  RAMNonAnimation.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import RAMAnimatedTabBarController



open class RAMNonAnimation: RAMItemAnimation {
  
  /**
   Start animation, method call when UITabBarItem is selected
   
   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   */
  open override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = iconSelectedColor
    }
    textLabel.textColor = textSelectedColor
  }
  
  /**
   Start animation, method call when UITabBarItem is unselected
   
   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   - parameter defaultTextColor: default UITabBarItem text color
   - parameter defaultIconColor: default UITabBarItem icon color
   */
  open override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
    textLabel.textColor = defaultTextColor
    
    if let iconImage = icon.image {
      let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImage.RenderingMode.alwaysOriginal :
        UIImage.RenderingMode.alwaysTemplate
      let renderImage = iconImage.withRenderingMode(renderMode)
      icon.image = renderImage
      icon.tintColor = defaultIconColor
    }
  }
  
  /**
   Method call when TabBarController did load
   
   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   */
  open override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
    textLabel.textColor = textSelectedColor
    
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = iconSelectedColor
    }
  }
  
}
