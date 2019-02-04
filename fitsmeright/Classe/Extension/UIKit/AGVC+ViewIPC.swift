//
//  AGVC+ViewIPC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
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
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func displayImagePickerAlert() {
    let ac = UIAlertController(title: "Choose image",
                               message: "Message",
                               preferredStyle: .actionSheet)
    let action_photo = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
      guard let _s = self else { return }
      _s.requestDevicePermission(with: .camera)
    }
    let action_library = UIAlertAction(title: "Photo Library", style: .default) { [weak self] _ in
      guard let _s = self else { return }
      _s.requestDevicePermission(with: .photoLibrary)
    }
    let action_cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    ac.addAction(action_photo)
    ac.addAction(action_library)
    ac.addAction(action_cancel)
    present(ac, animated: true, completion: nil)
  }
  
  func displayImagePickerPopup() {
    let vm = PopupListVCUC.ViewModel()
    vm.displayedHeader.style = .large
    vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
    vm.displayedHeader.subtitle = "Message"
    vm.displayedHeader.tint = c_custom.peach
    vm.displayedHeader.title = "Choose image"
    vm.displayedList.isHideFooter = true
    let vm_labelCA = LabelCAUC.ViewModel()
    let vm_cameraLabel = LabelCCUC.ViewModel()
    vm_cameraLabel.displayedLabel.title = "Camera"
    vm_cameraLabel.displayedLabel.style = .normal
    let vm_libraryLabel = LabelCCUC.ViewModel()
    vm_libraryLabel.displayedLabel.title = "Photo Library"
    vm_libraryLabel.displayedLabel.style = .normal
    let vm_cancelLabel = LabelCCUC.ViewModel()
    vm_cancelLabel.displayedLabel.title = "Cancel"
    vm_cancelLabel.displayedLabel.weight = .semibold
    vm_cancelLabel.displayedLabel.style = .negative
    vm_labelCA.displayedItems = [vm_cameraLabel, vm_libraryLabel, vm_cancelLabel]
    vm.displayedList.adapter = LabelCA.self
    vm.displayedList.viewModel = vm_labelCA
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
      displaySettingAlert(type)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
