//
//  PopupDialogable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import PopupDialog


public enum AGPopupPriority: Int {
  case common = 0
  case cilent
  case api
  case token
  case timeOut
}



extension AGPopupManager {
  
}



public class AGPopupManager {
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - LayoutConstraint
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public static let shared = AGPopupManager()
  
  
  
  //MARK: - Flag
  public var flag_alert = false
  
  
  
  //MARK: - Storage
  public var priority: AGPopupPriority = .common
  
  
  
  //MARK: - Initial
  private init() { }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  public func isHigher(with priority: AGPopupPriority) -> Bool {
    return priority.rawValue >= self.priority.rawValue
  }
  
  public func setPriority(with priority: AGPopupPriority) {
    self.priority = priority
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}



protocol PopupDialogable {
  func displayPopupContainer(_ viewModel: PopupContainerVCModel,
                             priority: AGPopupPriority,
                             on: UIViewController?,
                             onComplete: CBBool?)
}



extension PopupDialogable {
  
  
  //MARK: - Implements
  func displayPopupContainer(_ viewModel: PopupContainerVCModel,
                             priority: AGPopupPriority,
                             on: UIViewController?,
                             onComplete: CBBool?) {
    guard popup(with: priority) else { return }
    let vc = PopupContainerVC()
    vc.setupData(with: viewModel)
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.flag_selected))
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .zoomIn,
                         preferredWidth: UIScreen.main.bounds.width,
                         tapGestureDismissal: viewModel.tapDismissal,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  public func popup(with priority: AGPopupPriority) -> Bool {
    guard AGPopupManager.shared.isHigher(with: priority) else { return false }
    AGPopupManager.shared.setPriority(with: priority)
    return true
  }
  
  public func present(with popup: PopupDialog,
                      priority: AGPopupPriority,
                      on: UIViewController?,
                      onPresented: CBVoid? = nil) {
    if let on = on {
      on.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
    } else if let vc_top = UIViewController.top {
      vc_top.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
    }
  }
  
  public func dismissed(with priority: AGPopupPriority) {
    guard AGPopupManager.shared.isHigher(with: priority) else { return }
    AGPopupManager.shared.setPriority(with: .common)
  }
  
  
  
}


