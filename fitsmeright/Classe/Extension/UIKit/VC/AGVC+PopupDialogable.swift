//
//  AGVC+PopupDialogable.swift
//  fitsmeright
//
//  Created by Lynn Park on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



import PopupDialog




extension AGVC: PopupDialogable {
  
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
  //  func displayCreatePostPopup() {
  //    let vm = PopupContainerVCUC.ViewModel()
  //    vm.displayedHeader.style = .large
  //    vm.displayedHeader.icon = UIImage(color: .red, size: .less)
  //    vm.displayedHeader.style = .small
  //    vm.displayedHeader.subtitle = "subtitle"
  //    vm.displayedHeader.tint = .red
  //    vm.displayedHeader.title = "title"
  //    //    vm.displayedFooter.flag_hideCancel = true
  //    let v = CreatePostView()
  //    v.snp.makeConstraints {
  //      $0.height.equalTo(v.snp.width)
  //    }
  //    if let post = UserDefaults.Post.get() {
  //      let vm_createPost = CreatePostViewDisplayed()
  //      vm_createPost.isMerged = true
  //      vm_createPost.displayedPost.img_post = post._img_post
  //      v.setupData(with: vm_createPost)
  //    }
  //    vm.displayedContainer.injectedView = v
  //    vm.displayedContainer.tapDismissal = true
  //    displayPopupContainer(vm, priority: .common, on: self) { bool in
  //
  //    }
  //  }
  
  
  
  //MARK: - Private
  private func popup(with priority: PopupManager.Priority) -> Bool {
    guard PopupManager.shared.isHigher(with: priority) else { return false }
    PopupManager.shared.setPriority(with: priority)
    return true
  }
  
  private func present(with popup: PopupDialog,
                       priority: PopupManager.Priority,
                       on: UIViewController?,
                       onPresented: CBVoid? = nil) {
    if let on = on {
      on.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
      
    } else if let vc_top = SwifterSwift.mostTopViewController {
      vc_top.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
    }
  }
  
  private func dismissed(with priority: PopupManager.Priority) {
    guard PopupManager.shared.isHigher(with: priority) else { return }
    PopupManager.shared.setPriority(with: .common)
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - PopupDialogable
  func displayPopupContainer(_ viewModel: PopupContainerVCUC.Setup.ViewModel,
                             priority: PopupManager.Priority,
                             on: UIViewController?,
                             onComplete: CBBool?) {
    guard popup(with: priority),
      let displayed = viewModel.displayedSetup as? PopupContainerVCUC.Setup.DisplayedSetupPopupContainer else { return }
    let vc = PopupContainerVC()
    vc.setupData(with: viewModel)
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.isSelected))
      }
    }
    
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .zoomIn,
                         preferredWidth: UIScreen.main.bounds.width,
                         tapGestureDismissal: displayed.isTapOverlayEnabled,
                         panGestureDismissal: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displayPopupList(_ viewModel: PopupListVCUC.Setup.ViewModel,
                        priority: PopupManager.Priority,
                        on: UIViewController?,
                        onComplete: CBBoolIndexPath?) {
    guard popup(with: priority),
      let displayed = viewModel.displayedSetup as? PopupListVCUC.Setup.DisplayedSetupPopupList else { return }
    let vc = PopupListVC()
    vc.setupData(with: viewModel)
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.isSelected, vc.indexPathSeleted ?? IndexPath(row: 0, section: 0)))
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .zoomIn,
                         preferredWidth: UIScreen.main.bounds.width,
                         tapGestureDismissal: displayed.isTapOverlayEnabled,
                         panGestureDismissal: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
