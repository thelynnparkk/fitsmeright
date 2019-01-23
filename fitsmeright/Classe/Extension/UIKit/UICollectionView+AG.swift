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
  
}




//MARK: - Register cell
public extension UICollectionView {
  
  public func registerCellClass(_ cellClass: AnyClass) {
    let identifier = String(describing: cellClass.self)
    self.register(cellClass, forCellWithReuseIdentifier: identifier)
  }
  
  public func registerCellNib(_ cellClass: AnyClass) {
    let identifier = String(describing: cellClass.self)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forCellWithReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewClass(_ viewClass: AnyClass, kind: String) {
    let identifier = String(describing: viewClass.self)
    self.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewNib(_ viewClass: AnyClass, kind: String) {
    let identifier = String(describing: viewClass.self)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
}



//MARK: - Dequeue cell
public extension UICollectionView {
  
  public func dequeueReusableCell<T: AGCellInstantiatable>(_ type: T.Type, for index: IndexPath) -> T {
    return self.dequeueReusableCell(withReuseIdentifier: type.reuseId, for: index) as! T
  }
  
  public func dequeueReusableCell<T: AGCellInstantiatable>(_ ofKind: String, type: T.Type, for index: IndexPath) -> T {
    return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: type.reuseId, for: index) as! T
  }
  
}
