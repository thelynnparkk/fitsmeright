//
//  PopupVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



import PopupDialog



class PopupVCUC {
  
  class Setup {
    class DisplayedSetupPopup: AGVCUC.Setup.DisplayedSetup {
      var isTapOverlayEnabled = true
      var isTapContainerEnabled = true
      var isHideFooter = false
      var displayedHeader = PopupHeaderViewDisplayed()
      var displayedFooter = PopupFooterViewDisplayed()
    }
    class ViewModel: AGVCUC.Setup.ViewModel {
      
    }
  }
  
}



extension PopupVC
{
  
}



class PopupVC: AGVC {
  //MARK: - AGInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - LayoutConstraint
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  public var isSelected = false
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with viewModel: AGVCUC.Setup.ViewModel) {
    
  }
  
  
  
  //MARK: - Event
  @objc public func cancelButtonPressed() {
    isSelected = false
    dismiss(animated: true, completion: nil)
  }
  
  @objc public func okButtonPressed() {
    isSelected = true
    dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
