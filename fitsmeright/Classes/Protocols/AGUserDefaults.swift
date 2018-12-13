//
//  AGUserDefaults.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public protocol AGUserDefaults {
  static func getAll() -> [String: Any]
  static func removeAll()
}



public extension AGUserDefaults {
  
  //MARK: - Implements
  public static func getAll() -> [String: Any] {
    let ud = UserDefaults.standard
    return ud.dictionaryRepresentation()
  }
  
  public static func removeAll() {
    let ud = UserDefaults.standard
    ud.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
    ud.synchronize()
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}



public protocol AGUserDefaultsFoundation {
  associatedtype T
  static var key: String { get }
  static func get() -> T?
  static func set(data: T)
  static func remove()
}



public extension AGUserDefaultsFoundation {
  
  //MARK: - Implements
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
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}



public protocol AGUserDefaultsCodable: AGUserDefaultsFoundation where T: Codable {
  
}



public extension AGUserDefaultsCodable {
  
  //MARK: - Implements
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
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}

