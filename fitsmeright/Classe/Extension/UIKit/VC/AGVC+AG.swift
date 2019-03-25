//
//  AGVC+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift




extension AGVC
{
  
}



extension AGVC {
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - LifeCycle
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func displaySettingPopup(_ devicePermission: DevicePermission) {
    let displayed = PopupContainerVCUC.Setup.DisplayedSetupPopupContainer()
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = false
    displayed.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "subtitle"
    displayed.displayedHeader.tint = .red
    displayed.displayedHeader.title = devicePermission.message
    displayed.displayedFooter.title_cancel = "Cancel"
    displayed.displayedFooter.title_ok = "Setting"
    let vm = PopupContainerVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupContainer(vm, priority: .common, on: self) { [weak self] bool in
      guard let _s = self else { return }
      if bool {
        _s.navigateToSetting()
      } else {
        
      }
    }
  }
  
  
  
  
  //MARK: - Private
  private func navigateToSetting() {
    let url_setting = URL(string:UIApplication.openSettingsURLString)
    if let url = url_setting {
      UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

