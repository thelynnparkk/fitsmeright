//
//  UIBarButtonItem +AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SnapKit



extension UIBarButtonItem {
  
  private class WrapperView: UIView {
    var height_landScape: CGFloat = 32
    var size = CGSize(width: 44.0, height: 44.0)
    let v_underlying: UIView
    var alignmentRectInsetsOverride: UIEdgeInsets?
    override var alignmentRectInsets: UIEdgeInsets {
      return alignmentRectInsetsOverride ?? super.alignmentRectInsets
    }
    init(view: UIView, size: CGSize?) {
      if let s = size {
        self.size = s
      }
      v_underlying = view
      super.init(frame: view.bounds)
      addSubview(v_underlying)
      v_underlying.snp.makeConstraints {
        $0.top.right.bottom.left.equalToSuperview()
      }
      snp.makeConstraints { [weak self] in
        guard let _s = self else { return }
        $0.height.equalTo(height_landScape).priority(750)
        $0.height.equalTo(_s.size.height)
        $0.width.equalTo(_s.size.width)
      }
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
  }
  
  public convenience init(view: UIView, size: CGSize? = nil ,offset: CGFloat = 0) {
    let v_custom = UIBarButtonItem.WrapperView(view: view, size: size)
    if #available(iOS 11, *) {
      v_custom.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: -offset, bottom: 0, right: offset)
      v_custom.translatesAutoresizingMaskIntoConstraints = false
    } else {
      v_custom.frame.origin = .zero
    }
    self.init(customView: v_custom)
  }
  
}




