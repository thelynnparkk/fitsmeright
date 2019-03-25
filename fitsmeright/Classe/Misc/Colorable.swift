//
//  Colorable.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



protocol Colorable {
  var c_custom: UIColor.Custom.Type { get }
  var c_material: UIColor.Material.Type { get }
  var c_social: UIColor.Social.Type { get }
}



extension Colorable {
  
  //MARK: - Implement
  var c_custom: UIColor.Custom.Type {
    return UIColor.Custom.self
  }
  var c_material: UIColor.Material.Type {
    return UIColor.Material.self
  }
  var c_social: UIColor.Social.Type {
    return UIColor.Social.self
  }
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}



extension UIView: Colorable { }
extension UIViewController: Colorable { }

