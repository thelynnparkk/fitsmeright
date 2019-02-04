//
//  PopupManager.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension PopupManager {
  
}



public class PopupManager {
  
  //MARK: - Enum
  public enum Priority: Int {
    case common = 0
    case cilent
    case api
    case token
    case timeOut
  }
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - LayoutConstraint
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public static let shared = PopupManager()
  
  
  
  //MARK: - Flag
  public var flag_alert = false
  
  
  
  //MARK: - Storage
  public var priority: Priority = .common
  
  
  
  //MARK: - Initial
  private init() { }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  public func isHigher(with priority: Priority) -> Bool {
    return priority.rawValue >= self.priority.rawValue
  }
  
  public func setPriority(with priority: Priority) {
    self.priority = priority
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

