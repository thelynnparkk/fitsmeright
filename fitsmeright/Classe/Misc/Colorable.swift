//
//  Colorable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



protocol Colorable {
  var c: UIColor.Type { get }
  var c_custom: UIColor.Custom.Type { get }
}



extension Colorable
{
  
  //MARK: - Implement
  var c: UIColor.Type {
    return UIColor.self
  }
  var c_custom: UIColor.Custom.Type {
    return c.Custom.self
  }
  
  
  
  //MARK: - Public
  static var c: UIColor.Type {
    return UIColor.self
  }
  static var c_custom: UIColor.Custom.Type {
    return c.Custom.self
  }
  
  
  
  //MARK: - Private
  
  
  
}
