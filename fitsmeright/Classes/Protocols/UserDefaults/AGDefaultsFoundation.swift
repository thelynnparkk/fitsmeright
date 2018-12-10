//
//  AGDefaultsFoundation.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public protocol AGDefaultsFoundation {
  associatedtype T
  static var key: String { get }
  static func get() -> T?
  static func set(data: T)
  static func remove()
}



public extension AGDefaultsFoundation {
  
  public static func get() -> T? {
    let ud = UserDefaults.standard
    return ud.object(forKey: key) as? T
  }
  
  public static func set(data: T) {
    let ud = UserDefaults.standard
    ud.set(data, forKey: key)
  }
  
  public static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}



