//
//  FSPostClosetWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostClosetWorker {
  
  typealias FetchWhereResponse = (data: [FSPostCloset], error: Error?)
  static func fetchWhere(postId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSPostCloset.collection)
      .whereField(FSPostCloset.CodingKeys.postId.rawValue, isEqualTo: postId)
      .order(by: FSPostCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSPostCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  static func fetchWhere(closetId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSPostCloset.collection)
      .whereField(FSPostCloset.CodingKeys.closetId.rawValue, isEqualTo: closetId)
      .order(by: FSPostCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSPostCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsPost: FSPostCloset, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_postCloset = db.collection(FSPostCloset.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPost) else {
      response.error = AGError.error
      onComplete(response)
      return
    }
    var ref: DocumentReference? = nil
    ref = collection_postCloset.addDocument(data: fields) { error in
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





