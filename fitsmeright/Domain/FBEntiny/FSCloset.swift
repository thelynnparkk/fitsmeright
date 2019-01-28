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



extension FSCloset:
  Entitible
{
  
}



class FSCloset: FirestoreCodable {
  
  //MARK: - Key
  static let collection = "closets"
  enum CodingKeys: String, CodingKey {
    case userId
    case category
    case image
    case price
    case brand
    case place
    case size
    case updatedAt
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var ref: DocumentReference?
  var documentId: String?
  var userId: String?
  var category: Int?
  var image: String?
  var price: Int?
  var brand: String?
  var place: String?
  var size: String?
  var updatedAt: Timestamp?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var _documentId: String {
    return documentId ?? ""
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
  var _brand: String {
    return brand ?? ""
  }
  var _place: String {
    return place ?? ""
  }
  var _size: String {
    return size ?? ""
  }
  var _updatedAt: Timestamp {
    return updatedAt ?? Timestamp(date: Date())
  }
  var imageURL: URL? {
    return URL(string: _image)
  }
  var closetCategory: ClosetCategory {
    return ClosetCategory(rawValue: _category) ?? ClosetCategory.default
  }
  
  
  
  //MARK: - Private
  
  
  
  
}



