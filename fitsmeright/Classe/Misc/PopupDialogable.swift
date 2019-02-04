//
//  PopupDialogable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import PopupDialog



protocol PopupDialogable {
  
  func displayPopupContainer(_ viewModel: PopupContainerVCUC.ViewModel,
                             priority: PopupManager.Priority,
                             on: UIViewController?,
                             onComplete: CBBool?)
  func displayPopupList(_ viewModel: PopupListVCUC.ViewModel,
                        priority: PopupManager.Priority,
                        on: UIViewController?,
                        onComplete: CBBoolIndexPath?)
}



extension PopupDialogable {
  
  
  //MARK: - Implements
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  
}


