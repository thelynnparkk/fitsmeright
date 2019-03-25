//
//  PopupDialogable.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



import PopupDialog



protocol PopupDialogable {
  func displayPopupContainer(_ viewModel: PopupContainerVCUC.Setup.ViewModel,
                             priority: PopupManager.Priority,
                             on: UIViewController?,
                             onComplete: CBBool?)
  func displayPopupList(_ viewModel: PopupListVCUC.Setup.ViewModel,
                        priority: PopupManager.Priority,
                        on: UIViewController?,
                        onComplete: CBBoolIndexPath?)
}



extension PopupDialogable {
  
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  
}


