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
  
  typealias FetchResponse = (data: [FSCloset], error: Error?)
  static func fetch(onComplete: @escaping ((FetchResponse) -> ())) {
    var response: FetchResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSCloset.collection).order(by: FSCloset.CodingKeys.updatedAt.rawValue)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else { return }
        response.data = snapshot.documents.toObjects(FSCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias FetchWhereResponse = (data: [FSCloset], error: Error?)
  static func fetchWhere(userId: String?, onComplete: @escaping ((FetchResponse) -> ())) {
    var response: FetchResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSCloset.collection)
      .whereField(FSCloset.CodingKeys.userId.rawValue, isEqualTo: userId ?? "")
      .order(by: FSCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else { return }
        response.data = snapshot.documents.toObjects(FSCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias ObserveWhereResponse = (data: [FSCloset], error: Error?)
  static func observeWhere(userId: String, onComplete: @escaping ((FetchResponse) -> ())) {
    var response: FetchResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSCloset.collection)
      .whereField(FSCloset.CodingKeys.userId.rawValue, isEqualTo: userId)
      .order(by: FSCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.addSnapshotListener() { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else { return }
        response.data = snapshot.documents.toObjects(FSCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = Error?
  static func add(fsCloset: FSCloset, onComplete: @escaping ((UpdateResponse) -> ())) {
    var response: UpdateResponse = (nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSCloset.collection)
    guard let fields = try? FirestoreEncoder().encode(fsCloset) else {
      onComplete(response)
      return
    }
    collection_closets.addDocument(data: fields) { error in
      switch error {
      case .none:
        break
      case let .some(e):
        response = e
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
  
}





