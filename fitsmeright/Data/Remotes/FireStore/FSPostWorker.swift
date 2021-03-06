//
//  FSPostWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostWorker {
  
  typealias GetResponse = (data: FSPost, error: Error?)
  static func get(documentId: String, onComplete: @escaping ((GetResponse) -> ())) {
    var response: GetResponse = (FSPost(), nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSPost.collection)
      .document(documentId)
    collection_posts.getDocument { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot, let data = snapshot.toObject(FSPost.self) else {
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
  
  typealias FetchWhereResponse = (data: [FSPost], error: Error?)
  static func fetchWhere(userId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSPost.collection)
      .whereField(FSPost.CodingKeys.userId.rawValue, isEqualTo: userId)
      .order(by: FSPost.CodingKeys.updatedAt.rawValue, descending: true)
    collection_posts.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSPost.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsPost: FSPost, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_posts = db.collection(FSPost.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPost) else {
      onComplete(response)
      return
    }
    var ref: DocumentReference? = nil
    ref = collection_posts.addDocument(data: fields) { error in
      switch error {
      case .none:
        response = (ref, nil)
      case let .some(e):
        response = (nil, e)
      }
      onComplete(response)
    }
  }
  
  typealias UpdateResponse = Error?
  static func update(fsPost: FSPost, onComplete: @escaping ((UpdateResponse) -> ())) {
    var response: UpdateResponse = (nil)
    let db = Firestore.default
    let collection_posts = db.collection(FSPost.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPost) else {
      response = AGError.error
      onComplete(response)
      return
    }
    collection_posts.document(fsPost._documentId).updateData(fields) { error in
      switch error {
      case .none:
        break
      case let .some(e):
        response = e
      }
      onComplete(response)
    }
  }
  
  typealias  DeleteResponse = Error?
  static func delete(documentId: String, onComplete: @escaping ((DeleteResponse) -> ())) {
    var response: DeleteResponse = (nil)
    let db = Firestore.default
    let collection_posts = db.collection(FSPost.collection)
    collection_posts.document(documentId).delete() { error in
      switch error {
      case .none:
        break
      case let .some(e):
        response = e
      }
      onComplete(response)
    }
  }
  
}





