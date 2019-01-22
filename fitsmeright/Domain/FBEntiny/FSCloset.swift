//
//  FSCloset.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSCloset: Codable, AGEntity {
  
  //MARK: - Key
  static let collection = "closets"
  enum CodingKeys: String, CodingKey {
    case id
    case userId
    case category
    case image
    case price
    case usedTimes
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var id: String?
  var userId: String?
  var category: Int?
  var image: String?
  var price: Int?
  var usedTimes: Int?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _id: String {
    return id ?? ""
  }
  var _userId: String {
    return userId ?? ""
  }
  var _category: Int {
    return category ?? 0
  }
  var _image: String {
    return image ?? ""
  }
  var _price: Int {
    return price ?? 0
  }
  var _usedTimes: Int {
    return usedTimes ?? 0
  }
  var closetCategory: ClosetCategory {
    return ClosetCategory(rawValue: _category) ?? ClosetCategory.default
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



