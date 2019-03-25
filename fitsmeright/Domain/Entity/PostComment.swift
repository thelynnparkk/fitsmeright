//
//  PostComment.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension PostComment:
  Entitible
{
  
}



class PostComment {
  
  //MARK: - Key
  
  
  
  //MARK: - Storage
  var fsPostComment: FSPostComment?
  var fsUser: FSUser?
  
  
  
  //MARK: - Initial
  init() {
    
  }
  
  
  
  //MARK: - Public
  var _fsPostComment: FSPostComment {
    return fsPostComment ?? FSPostComment()
  }
  var _fsUser: FSUser {
    return fsUser ?? FSUser()
  }
  
  
  
  //MARK: - Private
  
  
  
}
