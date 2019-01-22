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
    let db = Firestore.default()
    let collection_closets = db.collection(FSCloset.collection)
    collection_closets.getDocuments { (snapshot, error) in
      var response: FetchResponse = ([], nil)
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
  
}





