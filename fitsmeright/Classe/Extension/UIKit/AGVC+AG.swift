//
//  AGVC+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit




extension AGVC
{
  
}



extension AGVC {
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  private var app_delegate: UIApplicationDelegate? {
    return UIApplication.shared.delegate
  }
  var window: UIWindow? {
    return app_delegate?.window ?? nil
  }
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc func popButtonPressed(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func dismissButtonPressed(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @objc func backButtonPressed(_ sender: Any) {
    var isDismiss = false
    if let nav = navigationController {
      if nav.viewControllers.count > 1 {
        nav.popViewController(animated: true)
      } else {
        isDismiss = true
      }
    } else {
      isDismiss = true
    }
    if isDismiss {
      dismiss(animated: true)
    }
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

