//
//  CATransition+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation
import QuartzCore



public extension CATransition {
  
  public enum Transition {
    case fade
    case push
  }
  
  public convenience init(transition: Transition) {
    self.init()
    duration = 0.3
    timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    switch transition {
    case .fade:
      type = CATransitionType.fade
    case .push:
      type = CATransitionType.push
    }
  }
  
}
