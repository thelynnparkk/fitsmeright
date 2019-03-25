//
//  AGVC+ViewIPC.swift
//  fitsmeright
//
//  Created by Lynn Park on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import MobileCoreServices
import Photos



extension AGVC: ViewIPCDelegate {
  
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
  func displayImagePickerPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_cameraLabel = LabelCCDisplayed()
      displayed_cameraLabel.title = "Camera"
      displayed_cameraLabel.style = .normal
      let displayed_libraryLabel = LabelCCDisplayed()
      displayed_libraryLabel.title = "Photo Library"
      displayed_libraryLabel.style = .normal
      let displayed_cancelLabel = LabelCCDisplayed()
      displayed_cancelLabel.title = "Cancel"
      displayed_cancelLabel.weight = .semibold
      displayed_cancelLabel.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_cameraLabel, displayed_libraryLabel, displayed_cancelLabel]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_choose").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Message"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Choose image"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.requestDevicePermission(with: .camera)
      case 1:
        _s.requestDevicePermission(with: .photoLibrary)
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - Private
  private func routeToCamera() {
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    let ipc = ViewIPC()
    ipc.delegate_viewIPC = self
    ipc.sourceType = .camera
    ipc.mediaTypes = [kUTTypeImage as String]
    ipc.allowsEditing = true
    present(ipc, animated: true, completion: nil)
  }
  
  private func routeToPhotoLibrary() {
    let ipc = ViewIPC()
    ipc.delegate_viewIPC = self
    ipc.sourceType = .photoLibrary
    ipc.mediaTypes = [kUTTypeImage as String]
    ipc.allowsEditing = true
    present(ipc, animated: true, completion: nil)
  }
  
  private func routeToVideoLibrary() {
    guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
    let ipc = ViewIPC()
    ipc.delegate_viewIPC = self
    ipc.sourceType = .photoLibrary
    ipc.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
    ipc.allowsEditing = false
    present(ipc, animated: true, completion: nil)
  }
  
  
  
  //MARK: - VIP - RequestDevicePermission
  func requestDevicePermission(with type: DevicePermission) {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      switch type {
      case .camera:
        AVCaptureDevice.requestAccess(for: .video) { success in
          present(isSuccess: success)
        }
      case .video, .photoLibrary:
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
          present(isSuccess: true)
        case .denied:
          present(isSuccess: false)
        case .notDetermined:
          PHPhotoLibrary.requestAuthorization{ status in
            guard status == PHAuthorizationStatus.authorized else {
              present(isSuccess: false)
              return
            }
            present(isSuccess: true)
          }
          break
        case .restricted:
          present(isSuccess: false)
          break
        default:
          break
        }
      case .location:
        break
      }
    }
    
    func present(isSuccess: Bool) {
      switch type {
      case .camera:
        guard isSuccess else {
          presentError()
          return
        }
        routeToCamera()
      case .video, .photoLibrary:
        guard isSuccess else {
          presentError()
          return
        }
        switch type {
        case .video:
          routeToVideoLibrary()
        case .photoLibrary:
          routeToPhotoLibrary()
        default:
          break
        }
      case .location:
        break
      }
    }
    
    func presentError() {
      displaySettingPopup(type)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
