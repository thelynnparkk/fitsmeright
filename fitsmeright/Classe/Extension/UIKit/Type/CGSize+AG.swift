//
//  CGSize+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 21/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension CGSize {
  
  var max: CGPoint {
    return CGPoint(x: width, y: height)
  }
  
  public static var less: CGSize {
    return CGSize(width: 1, height: 1)
  }
  
  init(side: CGFloat) {
    self.init(width: side, height: side)
  }
  
}
