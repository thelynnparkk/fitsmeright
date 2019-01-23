//
//  AGViewInstantiatable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



protocol AGViewInstantiatable {
  static var nib_name: String { get }
  var v_container: UIView! { get set }
  func loadContainerIntoNib()
}



extension AGViewInstantiatable where Self: UIView {
  
  //MARK: - Implement
  static var nib_name: String {
    return String(describing: Self.self)
  }
  
  func loadContainerIntoNib() {
    Bundle.main.loadNibNamed(Self.nib_name, owner: self, options: nil)
    v_container.match(in: self)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}

