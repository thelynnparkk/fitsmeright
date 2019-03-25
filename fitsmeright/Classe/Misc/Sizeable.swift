//
//  Sizeable.swift
//  fitsmeright
//
//  Created by Lynn Park on 19/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



protocol Sizeable {
  static func size(with bound: CGRect,
                   customItemSpace: CGFloat?,
                   customItemLine: CGFloat?,
                   customInset: UIEdgeInsets?) -> CGSize
  static func itemSpace(with bound: CGRect, custom: CGFloat?) -> CGFloat
  static func lineSpace(with bound: CGRect, custom: CGFloat?) -> CGFloat
  static func inset(with bound: CGRect, custom: UIEdgeInsets?) -> UIEdgeInsets
  static func offset(with bound: CGRect) -> CGFloat
}



extension Sizeable {
  
  
  //MARK: - Implement
  static func size(with bound: CGRect = .zero,
                   customItemSpace: CGFloat? = nil,
                   customItemLine: CGFloat? = nil,
                   customInset: UIEdgeInsets? = nil) -> CGSize {
    let spaces = itemSpace(custom: customItemSpace)
    let insets = inset(custom: customInset).right + inset(custom: customInset).left
    let side = (bound.width - spaces - insets)
    return CGSize(width: side, height: 60)
  }
  
  static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
    if let custom = custom {
      return custom
    }
    return 0
  }
  
  static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
    if let custom = custom {
      return custom
    }
    return 5
  }
  
  static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
    if let custom = custom {
      return custom
    }
    return UIEdgeInsets(inset: 5)
  }
  
  static func offset(with bound: CGRect = .zero) -> CGFloat {
    return .zero
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  
}


