//
//  Fontable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 21/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



protocol Fontable {
  var f_size: UIFont.Size.Type { get }
  var f_system: UIFont.System.Type { get }
  var f_custom: UIFont.Custom.Type { get }
}



extension Fontable {
  
  //MARK: - Implement
  var f_size: UIFont.Size.Type {
    return UIFont.Size.self
  }
  var f_system: UIFont.System.Type {
    return UIFont.System.self
  }
  var f_custom: UIFont.Custom.Type {
    return UIFont.Custom.self
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}



extension UIView: Fontable { }
extension UIViewController: Fontable { }

