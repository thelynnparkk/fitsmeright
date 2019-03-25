//
//  FSPostCommentWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



class FSPostCommentWorker {
  
  typealias AddResponse = (ref: DocumentReference?, error: Error?)
  static func add(fsPost: FSPostComment, onComplete: @escaping ((AddResponse) -> ())) {
    var response: AddResponse = (nil, nil)
    let db = Firestore.default
    let collection_posts = db.collection(FSPostComment.collection)
    guard let fields = try? FirestoreEncoder().encode(fsPost) else {
      onComplete(response)
      return
    }
    var ref: DocumentReference? = nil
    ref = collection_posts.addDocument(data: fields) { error in
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





