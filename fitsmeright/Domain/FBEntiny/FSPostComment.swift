//
//  FSPostComment.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSPostComment:
  Entitible
{
  
}



class FSPostComment: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "postcomments"
  enum CodingKeys: String, CodingKey {
    case postId
    case userId
    case comment
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
  var comment: String?
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
  var _comment: String {
    return comment ?? ""
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



