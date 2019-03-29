//
//  FSPostLike.swift
//  fitsmeright
//
//  Created by Lynn Park on 29/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSPostLike:
  Entitible
{
  
}



class FSPostLike: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "postlikes"
  enum CodingKeys: String, CodingKey {
    case postId
    case userId
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var postId: String?
  var userId: String?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
  }
  var _postId: String {
    return postId ?? ""
  }
  var _userId: String {
    return userId ?? ""
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



