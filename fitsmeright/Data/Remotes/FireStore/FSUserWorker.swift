//
//  FSUserWorker.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
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
        guard let snapshot = snapshot else { return }
        guard let data = snapshot.toObject(FSUser.self) else { return }
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
        guard let snapshot = snapshot else { return }
        response.data = snapshot.documents.toObjects(FSUser.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
//  typealias AddResponse = Error?
//  static func add(FSUser: FSUser, onComplete: @escaping ((AddResponse) -> ())) {
//    var response: AddResponse = (nil)
//    let db = Firestore.default
//    let collection_posts = db.collection(FSUser.collection)
//    guard let fields = try? FirestoreEncoder().encode(FSUser) else {
//      onComplete(response)
//      return
//    }
//    collection_posts.addDocument(data: fields) { error in
//      switch error {
//      case .none:
//        break
//      case let .some(e):
//        response = e
//      }
//      onComplete(response)
//    }
//  }
//
}





