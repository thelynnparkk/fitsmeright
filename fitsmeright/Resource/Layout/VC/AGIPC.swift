//
//  AGIPC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import MobileCoreServices
import Photos



extension DevicePermission:
  CaseIterable
{
  
}


enum DevicePermission: String {
  case camera
  case video
  case photoLibrary
  case location
  
  //MARK: - Constraint
  static let `default` = DevicePermission.camera
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var message: String {
    var message: String = ""
    switch self {
    case .camera:
      message = "Allow app to access this device photo library."
    case .video:
      message = "Allow app to access this device camera."
    case .photoLibrary:
      message = "Allow app to access this device video library."
    case .location:
      message = "Allow app to access this device location."
    }
    return message
  }

  
  
  //MARK: - Private
  
  
  
}



extension AGIPC:
  ViewIPCDelegate
{
  
}



class AGIPC: AGVC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func prepare() {
    super.prepare()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
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
  public func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    
  }
  
  public func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    
  }
  
  public func didCancelPickingMedia(_ picker: UIImagePickerController) {
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}






