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
    nb.barTintColor = .black
    nb.tintColor = .black
  }

}
