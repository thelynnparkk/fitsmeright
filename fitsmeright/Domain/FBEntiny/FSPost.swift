//
//  FSPost.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension FSPost:
  Entitible
{
  
}



class FSPost: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "posts"
  enum CodingKeys: String, CodingKey {
    case userId
    case image
    case caption
    case likes
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var userId: String?
  var image: String?
  var caption: String?
  var likes: Int?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
  }
  var _userId: String {
    return userId ?? ""
  }
  var _image: String {
    return image ?? ""
  }
  var _caption: String {
    return caption ?? ""
  }
  var _likes: Int {
    return likes ?? 0
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  var imageURL: URL? {
    return URL(string: _image)
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



