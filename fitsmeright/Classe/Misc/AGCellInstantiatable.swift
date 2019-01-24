//
//  AGCellInstantiatable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Foundation



public protocol AGCellInstantiatable {
  static var cell_name: String { get }
  static var reuseId: String { get }
//  var section: Int { get set }
//  var indexPath: IndexPath { get set }
}



extension AGCellInstantiatable {
  
  //MARK: - Implement
  public static var cell_name: String {
    return String(describing: self)
  }
  public static var reuseId: String {
    return String(describing: self)
  }
//  var section: Int {
//    return 0
//  }
//  var indexPath: IndexPath {
//    return IndexPath(row: 0, section: 0)
//  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}


