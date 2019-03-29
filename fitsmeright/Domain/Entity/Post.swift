//
//  Post.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import SwifterSwift



extension Post:
  Entitible
{
  
}



class Post {
  
  //MARK: - Key
  
  
  
  //MARK: - Storage
  var fsPost: FSPost?
  var fsUser: FSUser?
  var postClosetList: [PostCloset] = []
  var fsPostCommentList: [String] = []
  var fsPostLikeList: [FSPostLike] = []
  
  
  
  //MARK: - Initial
  init() {
    
  }
  
  
  
  //MARK: - Public
  var _fsPost: FSPost {
    return fsPost ?? FSPost()
  }
  var _fsUser: FSUser {
    return fsUser ?? FSUser()
  }
  
  
  
  //MARK: - Private
  
  
  
}
