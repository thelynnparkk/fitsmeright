//
//  Panelable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



protocol Panelable {
  var vc_panelVC: PanelVC? { get set }
  var isPanelListVisible: Bool { get set }
  func addPanelVC()
  func removePanelVC(onComplate: CBVoid?)
}



extension Panelable {
  
  //MARK: - Implements
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}


