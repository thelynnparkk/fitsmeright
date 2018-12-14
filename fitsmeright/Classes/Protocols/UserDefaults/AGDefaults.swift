//
//  AGDefault.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public protocol AGDefaults {
  
  static func getAll() -> [String: Any]
  static func removeAll()
  
}



public extension AGDefaults {
  
  public static func getAll() -> [String: Any] {
    let ud = UserDefaults.standard
    return ud.dictionaryRepresentation()
  }
  
  public static func removeAll() {
    let ud = UserDefaults.standard
    ud.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    ud.synchronize()
  }
  
}
