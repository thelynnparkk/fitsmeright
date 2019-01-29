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
  var view: UIView! { get set }
  func loadContainerIntoView()
}



extension AGViewInstantiatable where Self: UIView {
  
  //MARK: - Implement
  static var nib_name: String {
    return String(describing: Self.self)
  }
  
  func loadContainerIntoView() {
    Bundle.main.loadNibNamed(Self.nib_name, owner: self, options: nil)
    addSubview(view)
    view.fillToSuperview()
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}

