//
//  AGDefaultsCodable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public protocol AGDefaultsCodable: AGDefaultsFoundation where T: Codable {
  
}



public extension AGDefaultsCodable {
  
  public static func get() -> T? {
    let ud = UserDefaults.standard
    guard let userData = ud.data(forKey: key), let t = try? JSONDecoder().decode(T.self, from: userData) else {
      return nil
    }
    return t
  }
  
  public static func set(data: T) {
    guard let encoded = try? JSONEncoder().encode(data) else {
      return
    }
    let ud = UserDefaults.standard
    ud.set(encoded, forKey: key)
  }
  
  public static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}


