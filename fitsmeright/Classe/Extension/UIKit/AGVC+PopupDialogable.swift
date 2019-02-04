//
//  AGVC+PopupDialogable.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import PopupDialog



extension AGVC: PopupDialogable {
  
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
  func popupTest() {
    let value = "2"
    switch value {
    case "0":
      let vm = PopupContainerVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let v = CreatePostView()
      v.snp.makeConstraints {
        $0.height.equalTo(v.snp.width)
      }
      if let post = FMUserDefaults.Post.get() {
        let vm_createPost = CreatePostViewUC.ViewModel()
        vm_createPost.isMerged = true
        vm_createPost.displayedPost.img_post = post._img_post
        v.setupData(with: vm_createPost)
      }
      vm.displayedContainer.injectedView = v
      vm.displayedContainer.tapDismissal = true
      displayPopupContainer(vm, priority: .common, on: self) { bool in
        
      }
    case "1":
      let vm = PopupContainerVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let v = ClosetFormView()
      v.snp.makeConstraints {
        $0.height.equalTo(50)
      }
      let vm_closetForm = ClosetFormViewUC.ViewModel()
      vm_closetForm.displayedForm.isEditable = true
      vm_closetForm.displayedForm.key = "Key"
      vm_closetForm.displayedForm.placeHolder = "value"
      //      vm_closetForm.displayedForm
      v.setupData(with: vm_closetForm)
      vm.displayedContainer.injectedView = v
      vm.displayedContainer.tapDismissal = true
      displayPopupContainer(vm, priority: .common, on: self) { bool in
        
      }
    case "2":
      let vm = PopupListVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let vm_imageCA = ImageCAUC.ViewModel()
      var urls = [
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495936804.jpg?alt=media&token=3b5070b0-7c2e-4ff7-8e9e-ce79aa4215c2",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495953089.jpg?alt=media&token=e53a9fa4-40c0-4e43-b46b-aade819609e1",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495975284.jpg?alt=media&token=0f7293d4-27a3-4457-ac07-cb7aaba69f8e"
      ]
      urls += urls
      urls += urls
      urls += urls
      //      urls = []
      //      vm.displayedList.isHideFooter = true
      vm_imageCA.displayedItems = urls.compactMap({
        let vm = ImageCCUC.ViewModel()
        vm.displayedImage.imageURL = URL(string: $0)
        return vm
      })
      //      vm.displayedFooter.kind = UICollectionView.elementKindSectionFooter
      vm_imageCA.displayedFooter.title = "\(vm_imageCA.displayedItems.count) items"
      vm.displayedList.adapter = ImageCA.self
      vm.displayedList.viewModel = vm_imageCA
      vm.displayedList.tapDismissal = true
      displayPopupList(vm, priority: .common, on: self) { bool in
        
      }
    default:
      break
    }
    
  }
  
  
  
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
    } else if let vc_top = UIViewController.top {
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
  func displayPopupContainer(_ viewModel: PopupContainerVCUC.ViewModel,
                             priority: PopupManager.Priority,
                             on: UIViewController?,
                             onComplete: CBBool?) {
    guard popup(with: priority) else { return }
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
                         tapGestureDismissal: viewModel.displayedContainer.tapDismissal,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displayPopupList(_ viewModel: PopupListVCUC.ViewModel,
                        priority: PopupManager.Priority,
                        on: UIViewController?,
                        onComplete: CBBoolIndexPath?) {
    guard popup(with: priority) else { return }
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
                         tapGestureDismissal: viewModel.displayedList.tapDismissal,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
