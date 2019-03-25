//
//  UIPanGestureRecognizer+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension UIPanGestureRecognizer {
  
  enum Direction: Int {
    case up
    case down
    case left
    case right
    
    public var isHonrizonal: Bool {
      return [.left, .right].contains(self)
    }
    public var isVertical: Bool {
      return !isHonrizonal
    }
  }
  
  var direction: Direction? {
    let v = velocity(in: view)
    let vertical = abs(v.y) > abs(v.x)
    switch (vertical, v.x, v.y) {
    case (true, _, let y) where y < 0: return .up
    case (true, _, let y) where y > 0: return .down
    case (false, let x, _) where x > 0: return .right
    case (false, let x, _) where x < 0: return .left
    default: return nil
    }
  }
  
}
