//
//  FSPostWorker.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 22/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostWorker {
  
  typealias FetchWhereResponse = (data: [FSPost], error: Error?)
  static func fetchWhere(userId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSPost.collection)
      .whereField(FSPost.CodingKeys.userId.rawValue, isEqualTo: userId)
      .order(by: FSPost.CodingKeys.updatedAt.rawValue, descending: false)
    collection_posts.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else { return }
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
  
}





