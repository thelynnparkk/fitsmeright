//
//  AGEntity.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public protocol AGEntity {
  var description: String { get }
}



public extension AGEntity {
  
  //MARK: - Implements
  public var description: String {
    var description = ""
    let mirror = Mirror(reflecting: self)
    for m in mirror.children {
      if let p = m.label {
        description += "\(p): \(m.value)\n"
      }
    }
    return description
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}

