//
//  DevicePermission.swift
//  fitsmeright
//
//  Created by Lynn Park on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension DevicePermission:
  CaseIterable
{
  
}


enum DevicePermission: String {
  case camera
  case video
  case photoLibrary
  case location
  
  //MARK: - Constraint
  static let `default` = DevicePermission.camera
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var message: String {
    var message: String = ""
    switch self {
    case .camera:
      message = "Allow app to access this device photo library."
    case .video:
      message = "Allow app to access this device camera."
    case .photoLibrary:
      message = "Allow app to access this device video library."
    case .location:
      message = "Allow app to access this device location."
    }
    return message
  }
  
  
  
  //MARK: - Private
  
  
  
}
