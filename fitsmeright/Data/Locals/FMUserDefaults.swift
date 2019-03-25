//
//  UserDefaults.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



extension UserDefaults: AGUserDefaults {
  
  
  enum AppLaunched: AGUserDefaultsFoundation {
    typealias T = Bool
    static let key = "AppLaunched"
  }
  
  enum LoggedIn: AGUserDefaultsFoundation {
    typealias T = Bool
    static let key = "LoggedIn"
  }

  enum FSUserDefault: AGUserDefaultsCodable {
    typealias T = FSUser
    static let key = "FSUser"
  }
  
}
