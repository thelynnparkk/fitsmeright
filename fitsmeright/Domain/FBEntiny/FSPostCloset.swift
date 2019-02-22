//
//  FSPostCloset.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSPostCloset:
  Entitible
{
  
}



class FSPostCloset: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "postclosets"
  enum CodingKeys: String, CodingKey {
    case postId
    case locationPercentX
    case locationPercentY
    case closetId
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var postId: String?
  var locationPercentX: Int?
  var locationPercentY: Int?
  var closetId: String?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
  }
  var _postId: String {
    return postId ?? ""
  }
  var _locationPercentX: Int {
    return locationPercentX ?? 0
  }
  var _locationPercentY: Int {
    return locationPercentY ?? 0
  }
  var _closetId: String {
    return closetId ?? ""
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



