//
//  PostCloset.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension PostCloset:
  Entitible
{
  
}



class PostCloset {
  
  //MARK: - Key
  
  
  
  //MARK: - Storage
  var fsPostCloset: FSPostCloset?
  var fsCloset: FSCloset?
  
  
  
  //MARK: - Initial
  init() {
    
  }
  
  
  
  //MARK: - Public
  var _fsPostCloset: FSPostCloset {
    return fsPostCloset ?? FSPostCloset()
  }
  var _fsCloset: FSCloset {
    return fsCloset ?? FSCloset()
  }
  
  
  
  //MARK: - Private
  
  
  
}
