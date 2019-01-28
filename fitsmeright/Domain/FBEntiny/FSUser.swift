//
//  FSUser.swift
//  fitsmeright
//
//  Created by Lynn Park on 25/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSUser:
  Entitible
{
  
}



class FSUser: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "users"
  enum CodingKeys: String, CodingKey {
    case documentId
    case facebookId
    case email
    case username
    case displayName
    case password
    case bio
    case image
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var facebookId: String?
  var email: String?
  var username: String?
  var displayName: String?
  var password: String?
  var bio: String?
  var image: String?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
  }
  var _facebookId: String {
    return facebookId ?? ""
  }
  var _email: String {
    return email ?? ""
  }
  var _username: String {
    return username ?? ""
  }
  var _displayName: String {
    return displayName ?? ""
  }
  var _password: String {
    return password ?? ""
  }
  var _bio: String {
    return bio ?? ""
  }
  var _image: String {
    return image ?? ""
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  var imageURL: URL? {
    return URL(string: _image)
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



