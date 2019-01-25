//
//  FirestoreCodable.swift
//  fitsmeright
//
//  Created by Lynn Park on 25/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



protocol FirestoreCodable: Codable {
  var ref: DocumentReference? { get set }
  var documentId: String? { get set }
}

extension FirestoreCodable {
  
}
