//
//  AGVCImagePickerable.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import MobileCoreServices



extension UIImagePickerController {
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func setup() {
    let nb = navigationBar
    nb.barStyle = .black
    nb.barTintColor = UIColor.black
    nb.tintColor = UIColor.black
  }
  
  func displayImagePicker(on vc: (UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
    delegate = vc
    setup()
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
      let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let takephoto = UIAlertAction(title: "common_takephoto", style: .default, handler: { action in
        self.sourceType = .camera
        vc.present(self, animated: true, completion:nil)
      })
      
      let gallery = UIAlertAction(title: "common_gallery", style: .default, handler: { action in
        self.sourceType = .photoLibrary
        vc.present(self, animated: true, completion:nil)
      })
      
      let cancelAction = UIAlertAction(title: "commonCancel", style: .cancel, handler: nil)
      alert.addAction(takephoto)
      alert.addAction(gallery)
      alert.addAction(cancelAction)
      
      vc.present(alert, animated: true, completion: nil)
    } else {
      sourceType = .photoLibrary
      vc.present(self, animated: true, completion:nil)
    }
  }
  
}
