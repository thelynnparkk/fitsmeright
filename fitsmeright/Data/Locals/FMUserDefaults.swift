//
//  FMUserDefaults.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



class FMUserDefaults: AGUserDefaults {
  
  enum AppLaunched: AGUserDefaultsFoundation {
    typealias T = Bool
    static let key = "AppLaunched"
  }
  
  enum LoggedIn: AGUserDefaultsFoundation {
    typealias T = Bool
    static let key = "LoggedIn"
  }
  
}
