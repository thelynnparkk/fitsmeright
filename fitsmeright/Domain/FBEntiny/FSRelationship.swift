//
//  FSRelationship.swift
//  fitsmeright
//
//  Created by Lynn Park on 26/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSRelationship:
  Entitible
{
  
}



class FSRelationship: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "relationships"
  enum CodingKeys: String, CodingKey {
    case userOneId
    case userTwoId
    case status
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var userOneId: String?
  var userTwoId: String?
  var status: Int?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
  }
  var _userOneId: String {
    return userOneId ?? ""
  }
  var _userTwoId: String {
    return userTwoId ?? ""
  }
  var _status: Int {
    return status ?? 0
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  var userRelationStatus: UserRelationStatus {
    return UserRelationStatus(rawValue: _status) ?? UserRelationStatus.default
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



