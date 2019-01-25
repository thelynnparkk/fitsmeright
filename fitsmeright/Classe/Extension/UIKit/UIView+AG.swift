//
//  UIView+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension UIView {
  
  func setupViewFrame() {
    setNeedsLayout()
    layoutIfNeeded()
  }
//
//
//  func match(in parent: UIView!) -> Void{
//    self.translatesAutoresizingMaskIntoConstraints = false;
//    self.frame = parent.frame;
//    parent.addSubview(self);
//    NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parent, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
//    NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parent, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
//    NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parent, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
//    NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parent, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
//  }
//  
}
