//
//  Firestore+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension Firestore {
  
  static var `default`: Firestore {
    let db = Firestore.firestore()
    let st = db.settings
    st.areTimestampsInSnapshotsEnabled = true
    db.settings = st
    return db
  }
  
}
