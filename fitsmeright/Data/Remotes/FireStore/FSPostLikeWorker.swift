//
//  FSPostLikeWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 29/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostLikeWorker {
  
  typealias FetchWhereResponse = (data: [FSPostLike], error: Error?)
  static func fetchWhere(postId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSPostLike.collection)
      .whereField(FSPostLike.CodingKeys.postId.rawValue, isEqualTo: postId)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSPostLike.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  static func fetchWhere(postId: String, userId: String, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_posts = db
      .collection(FSPostLike.collection)
      .whereField(FSPostLike.CodingKeys.postId.rawValue, isEqualTo: postId)
      .whereField(FSPostLike.CodingKeys.userId.rawValue, isEqualTo: userId)
    collection_posts.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else {
          response.error = AGError.error
          break
        }
        response.data = snapshot.documents.toObjects(FSPostLike.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsPostLike: FSPostLike, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_postCloset = db.collection(FSPostLike.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPostLike) else {
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
  
  typealias  DeleteResponse = Error?
  static func delete(documentId: String, onComplete: @escaping ((DeleteResponse) -> ())) {
    var response: DeleteResponse = (nil)
    let db = Firestore.default
    let collection_closets = db.collection(FSPostLike.collection)
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





