//
//  FSPostClosetWorker.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostClosetWorker {
  
  typealias FetchWhereResponse = (data: [FSPostCloset], error: Error?)
  static func fetchWhere(postId: String?, onComplete: @escaping ((FetchWhereResponse) -> ())) {
    var response: FetchWhereResponse = ([], nil)
    let db = Firestore.default
    let collection_closets = db
      .collection(FSPostCloset.collection)
      .whereField(FSPostCloset.CodingKeys.postId.rawValue, isEqualTo: postId ?? "")
      .order(by: FSPostCloset.CodingKeys.updatedAt.rawValue, descending: false)
    collection_closets.getDocuments { (snapshot, error) in
      switch error {
      case .none:
        guard let snapshot = snapshot else { return }
        response.data = snapshot.documents.toObjects(FSPostCloset.self)
      case let .some(e):
        response.error = e
      }
      onComplete(response)
    }
  }
  
  typealias AddResponse = Error?
  static func add(fsPost: FSPostCloset, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil)
    let db = Firestore.default
    let collection_postCloset = db.collection(FSPostCloset.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPost) else {
      onComplete(response)
      return
    }
    collection_postCloset.addDocument(data: fields) { error in
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





