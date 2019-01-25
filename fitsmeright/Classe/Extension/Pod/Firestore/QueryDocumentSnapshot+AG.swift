//
//  QueryDocumentSnapshot+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension Collection where Element == QueryDocumentSnapshot {
  
  func toObjects<T: FirestoreCodable>(_ type: T.Type) -> [T] {
    var objects: [T] = []
    for d in self {
      do {
        var decoded = try FirestoreDecoder().decode(type, from: d.data())
        decoded.ref = d.reference
        decoded.documentId = d.documentID
        objects.append(decoded)
      } catch let e {
        print(e.localizedDescription)
        continue
      }
    }
    return objects
  }
  
}


