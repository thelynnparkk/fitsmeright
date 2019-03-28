//
//  Firestore+CodableFirebase.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseFirestore
import CodableFirebase



extension DocumentReference: DocumentReferenceType { }
extension GeoPoint: GeoPointType { }
extension FieldValue: FieldValueType { }
extension Timestamp: TimestampType, Comparable {
  public static func < (lhs: Timestamp, rhs: Timestamp) -> Bool {
    return lhs.dateValue() < rhs.dateValue()
  }
}
