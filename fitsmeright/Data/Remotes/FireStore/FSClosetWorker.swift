//
//  FSClosetWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSClosetWorker {
  
  typealias GetResponse = (data: FSCloset, error: Error?)
  static func get(documentId: String, onComplete: @escaping ((GetResponse) -> ())) {
    var response: GetResponse = (FSCloset(), nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSCloset.collection)
      .document(documentId)
    collection_posts.getDocument { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot, let data = snapshot.toObject(FSCloset.self) else {
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
  
  typealias FetchWhereResponse = (data: [FSCloset], error: Error?)
  static func fetchWhere(userId: String?, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSCloset.collection)
      .whereField(FSCloset.CodingKeys.userId.rawValue, isEqualTo: userId ?? "")
      .order(by: FSCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias ObserveWhereResponse = (data: [FSCloset], error: Error?)
  static func observeWhere(userId: String, onComplete: @escaping ((ObserveWhereResponse) -> ())) {
    var response: ObserveWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSCloset.collection)
      .whereField(FSCloset.CodingKeys.userId.rawValue, isEqualTo: userId)
      .order(by: FSCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.addSnapshotListener() { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsCloset: FSCloset, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSCloset.collection)
    guard let fields = try? FirestoreEncoder().encode(fsCloset) else {
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
  
  typealias UpdateResponse = Error?
  static func update(fsCloset: FSCloset, onComplete: @escaping ((UpdateResponse) -> ())) {
    var response: UpdateResponse = (nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSCloset.collection)
    guard let fields = try? FirestoreEncoder().encode(fsCloset) else {
      response = AGError.error
      onComplete(response)
      return
    }
    collection_closets.document(fsCloset._documentId).updateData(fields) { error in
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
    let collection_closets = db.collection(FSCloset.collection)
    collection_closets.document(documentId).delete() { error in
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





