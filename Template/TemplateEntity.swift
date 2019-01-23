//
//  TemplateEntity.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



//MARK: - Core
import Foundation



//MARK: - Pod



extension TemplateEntity:
  Entitible
{
  
}



class TemplateEntity {
  
  //MARK: - Key
  
  
  
  //MARK: - Storage
  var id : Int?
  
  
  
  //MARK: - Initial
  init?() {
    
  }
  
  
  
  //MARK: - Public
  var _id: Int {
    return id ?? 0
  }
  
  
  
  //MARK: - Private
  
  
  
}
