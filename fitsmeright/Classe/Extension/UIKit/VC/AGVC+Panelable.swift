//
//  AGVC+Panelable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension AGVC: Panelable {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Panelable
  func addPanelVC() {
    isPanelListVisible = true
    addChild(vc_panelVC!)
    view.addSubview(vc_panelVC!.view)
    vc_panelVC!.didMove(toParent: self)
    let height = view.frame.height
    let width  = view.frame.width
    vc_panelVC!.view.frame = CGRect(x: 0, y: view.frame.maxY , width: width, height: height)
    vc_panelVC!.view.addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
  }
  
  func removePanelVC(onComplate: CBVoid? = nil) {
    isPanelListVisible = false
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    var frame = self.vc_panelVC?.view.frame ?? .zero
                    frame.origin.y = UIScreen.main.bounds.maxY
                    self.vc_panelVC?.view.frame = frame
                    
    }, completion: { _ in
      self.vc_panelVC?.view.removeFromSuperview()
      self.vc_panelVC?.removeFromParent()
      onComplate?()
    })
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
