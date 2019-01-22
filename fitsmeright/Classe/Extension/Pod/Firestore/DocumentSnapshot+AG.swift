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
  
}
