//
//  UICollectionView+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



//MARK: - Setup
public extension UICollectionView {
  
  public func setupCollectionDefault() {
    setupScrollDefault()
  }
  
  public func setBackgroundImage(image: UIImage) {
    backgroundColor = .clear
    let img = UIImageView(image: image)
    img.contentMode = .scaleAspectFill
    backgroundView = img
  }
  
  public func register(nibWithCellClass name: AnyClass, kind: String) {
    let identifier = String(describing: name.self)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
  public func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
    register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
  }
  
}
