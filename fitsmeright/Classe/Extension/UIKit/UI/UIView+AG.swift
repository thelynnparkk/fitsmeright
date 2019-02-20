//
//  UIView+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import SwifterSwift



extension UIView {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  func setupViewFrame() {
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  
  
  //MARK: - Private
  
  
  
}



extension UIView {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  class var nib_name: String {
    return String(describing: self)
  }
  
  class func view() -> Self {
    return instantiateFromNib()
  }
  
  
  
  //MARK: - Private
  fileprivate class var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  fileprivate class func instantiateFromNib<T:UIView>() -> T {
    let t = T()
    let view = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as! UIView
    t.addSubview(view)
    view.fillToSuperview()
    return t
  }
  
}
