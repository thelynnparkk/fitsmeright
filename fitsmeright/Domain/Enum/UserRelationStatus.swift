//
//  UserRelationStatus.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 27/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension UserRelationStatus:
  CaseIterable
{
  
}



enum UserRelationStatus: Int {
  case request = 1
  case accept
  
  
  
  //MARK: - Constraint
  static let `default` = UserRelationStatus.request
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var name: String {
    var name = ""
    switch self {
    case .request:
      name = "request"
    case .accept:
      name = "accept"
    }
    return name
  }
  
  
  
  //MARK: - Private
  
  
  
}
