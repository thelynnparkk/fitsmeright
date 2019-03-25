//
//  FSUserWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseStorage
import FirebaseFirestore
import CodableFirebase




class FSUserWorker {
  
  typealias GetResponse = (data: FSUser, error: Error?)
  static func get(documentId: String, onComplete: @escaping ((GetResponse) -> ())) {
    var response: GetResponse = (FSUser(), nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSUser.collection)
      .document(documentId)
    collection_posts.getDocument { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot,
          let data = snapshot.toObject(FSUser.self) else {
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
  
  static func get(email: String, password: String, onComplete: @escaping ((GetResponse) -> ())) {
    var response: GetResponse = (FSUser(), nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSUser.collection)
      .whereField(FSUser.CodingKeys.email.rawValue, isEqualTo: email)
      .whereField(FSUser.CodingKeys.password.rawValue, isEqualTo: password)
    collection_posts.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot,
          let data = snapshot.documents.first?.toObject(FSUser.self) else {
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
  
  typealias FetchWhereResponse = (data: [FSUser], error: Error?)
  static func fetchWhere(userId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSUser.collection)
      .order(by: FSUser.CodingKeys.updatedAt.rawValue, descending: false)
    collection_posts.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSUser.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsUser: FSUser, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_users = db.collection(FSUser.collection)
    guard let fields = try? FirestoreEncoder().encode(fsUser) else {
      response.error = AGError.error
      onComplete(response)
      return
    }
    var ref: DocumentReference? = nil
    ref = collection_users.addDocument(data: fields) { error in
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
  static func update(fsUser: FSUser, onComplete: @escaping ((UpdateResponse) -> ())) {
    var response: UpdateResponse = (nil)
    let db = Firestore.default
    let collection_users = db.collection(FSUser.collection)
    guard let fields = try? FirestoreEncoder().encode(fsUser) else {
      response = AGError.error
      onComplete(response)
      return
    }
    collection_users.document(fsUser._documentId).updateData(fields) { error in
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


