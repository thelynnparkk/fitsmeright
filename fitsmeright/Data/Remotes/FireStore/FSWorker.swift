//
//  FSWorker.swift
//  fitsmeright
//
//  Created by Lynn Park on 25/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Firebase
import FirebaseStorage
import FirebaseFirestore
import CodableFirebase




class FSWorker {
  
  typealias UploadUserImageResponse = (url: URL?, error: Error?)
  static func uploadImage(folder: String, image: UIImage?, onComplete: @escaping ((UploadUserImageResponse) -> ())) {
    var response: UploadUserImageResponse = (nil, nil)
    guard let data = image?.jpegData(compressionQuality: 1) else {
      response.error = AGError.error
      onComplete(response)
      return
    }
    let ref_folder = Storage.storage().reference(withPath: folder)
    let ref_create = ref_folder.child("\(Date().millisecondsSince1970).jpg")
    ref_create.putData(data, metadata: nil) { (metadata, error) in
      if let e = error {
        print(e.localizedDescription)
        response.error = e
        onComplete(response)
        return
      }
      guard let _ = metadata else {
        response.error = AGError.error
        onComplete(response)
        return
      }
      ref_create.downloadURL { (url, error) in
        if let e = error {
          print(e.localizedDescription)
          response.error = e
          onComplete(response)
          return
        }
        guard let url = url else {
          response.error = AGError.error
          onComplete(response)
          return
        }
        response.url = url
        onComplete(response)
      }
    }
  }
  
  static func deleteImage(url: String) {
    let ref_old = Storage.storage().reference(forURL: url)
    ref_old.delete()
  }
  
}


