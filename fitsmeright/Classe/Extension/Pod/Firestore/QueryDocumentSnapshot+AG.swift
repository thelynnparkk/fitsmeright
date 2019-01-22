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
  
  func toObjects<T: Decodable>(_ type: T.Type) -> [T] {
    var objects: [T] = []
    for d in self {
      do {
        let decoded = try FirestoreDecoder().decode(type, from: d.data())
        objects.append(decoded)
      } catch let e {
        print(e.localizedDescription)
        continue
      }
    }
    return objects
  }
  
}


