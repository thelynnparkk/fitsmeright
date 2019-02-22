//
//  DocumentSnapshot+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension DocumentSnapshot {
  
  func log() {
    print("parent: \(reference.parent)")
    print("documentID: \(documentID)")
    print("data: \(String(describing: data()))")
  }
  
  func toObject<T: FirestoreCodable>(_ type: T.Type) -> T? {
    do {
      var decoded = try FirestoreDecoder().decode(type, from: data() ?? [:])
      decoded.ref = reference
      decoded.documentId = documentID
      return decoded
    } catch let e {
      print(e.localizedDescription)
      return nil
    }
  }
  
}
