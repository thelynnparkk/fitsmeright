//
//  CATransition+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation
import QuartzCore



//MARK: - Type
public extension CATransition {
  
  public enum Style {
    case fade
    case push
  }
  
  public convenience init(style: Style, duration: CFTimeInterval) {
    self.init()
    self.duration = duration
    timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    switch style {
    case .fade:
      type = CATransitionType.fade
    case .push:
      type = CATransitionType.push
    }
  }
  
}
