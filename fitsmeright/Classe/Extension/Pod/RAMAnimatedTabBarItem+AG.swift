//
//  RAMAnimatedTabBarItem+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 11/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import RAMAnimatedTabBarController



extension RAMAnimatedTabBarItem {
  
  func setupWith(color: UIColor, selectedColor: UIColor, itemAnimation: RAMItemAnimation) {
    textColor = color
    iconColor = color
    let itemAnimation = itemAnimation
    itemAnimation.iconSelectedColor = selectedColor
    itemAnimation.textSelectedColor = selectedColor
    animation = itemAnimation
  }
  
}
