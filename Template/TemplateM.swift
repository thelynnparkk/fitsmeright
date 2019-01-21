//
//  TemplateM.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation



public class TemplateD: AGEntity {

  //MARK: - Key
  public enum Key {
    static var id = "id"
  }
  
  
  
  //MARK: - Storage
  public var id : Int?



  //MARK: - Initial
  public init() {
    
  }



  //MARK: - Public
  public var _id: Int {
    return id ?? 0
  }



  //MARK: - Private
  

  
}



