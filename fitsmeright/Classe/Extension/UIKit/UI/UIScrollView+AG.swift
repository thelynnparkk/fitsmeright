//
//  UIScrollView+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



//MARK: - Setup
public extension UIScrollView {
  
  public func setupScrollDefault() {
    isScrollEnabled = true
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
    bounces = true
    alwaysBounceVertical = false
    alwaysBounceHorizontal = false
    backgroundColor = UIColor.clear
  }
  
  public func setupScrollHorizontal() {
    alwaysBounceHorizontal = true
    showsHorizontalScrollIndicator = true
  }
  
  public func setupScrollVertical() {
    alwaysBounceVertical = true
    showsVerticalScrollIndicator = true
  }
  
}
