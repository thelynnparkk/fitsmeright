//
//  FSRelationshipWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 27/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseStorage
import FirebaseFirestore
import CodableFirebase




class FSRelationshipWorker {
  
  typealias GetResponse = (data: FSRelationship, error: Error?)
  static func get(userOneId: String, userTwoId: String, onComplete: @escaping ((GetResponse) -> ())) {
    var response: GetResponse = (FSRelationship(), nil)
    let db = Firestore.default
    let collection_relationship = db
      .collection(FSRelationship.collection)
      .whereField(FSRelationship.CodingKeys.userOneId.rawValue, isEqualTo: userOneId)
      .whereField(FSRelationship.CodingKeys.userTwoId.rawValue, isEqualTo: userTwoId)
    collection_relationship.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot,
          let data = snapshot.documents.first?.toObject(FSRelationship.self) else {
            response.error = AGError.error
            break
        }
        response.data = data
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias FetchWhereResponse = (data: [FSRelationship], error: Error?)
  static func fetchWhere(userOneId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_relationships = db
      .collection(FSRelationship.collection)
      .whereField(FSRelationship.CodingKeys.userOneId.rawValue, isEqualTo: userOneId)
    collection_relationships.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSRelationship.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsRelationship: FSRelationship, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSRelationship.collection)
    guard let fields = try? FirestoreEncoder().encode(fsRelationship) else {
      response.error = AGError.error
      onComplete(response)
      return
    }
    var ref: DocumentReference? = nil
    ref = collection_closets.addDocument(data: fields) { error in
      switch error {
      case .none:
        response.ref = ref
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
}
