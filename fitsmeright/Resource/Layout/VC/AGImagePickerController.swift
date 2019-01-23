//
//  AGImagePickerController.swift
//  fitsmeright
//
//  Created by Lynn Park on 11/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import Foundation
import UIKit
import MobileCoreServices
import AVFoundation
import Photos



protocol AGImagePCDelegate {
  func didFinishPickingMedia(_ picker: UIImagePickerController, with image: UIImage)
  func didFinishPickingMediaError(_ picker: UIImagePickerController)
  func didCancelPickingMedia(_ picker: UIImagePickerController)
}



extension AGImagePC:
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate
{
  
}



class AGImagePC: UIImagePickerController {
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias VCAGImagePCDelegate = (UIViewController & AGImagePCDelegate)
  
  
  
  //MARK: - Instance
  var delegate_agImagePicker: AGImagePCDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override var childForStatusBarHidden: UIViewController? {
    return nil
  }
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    //MARK: Core
    delegate = self
    let nb = navigationController?.navigationBar
    nb?.setupWith(content: .white, bg: .black, isTranslucent: false)
    
    
    
    //MARK: UI
    
    
    
    //MARK: Misc
    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  static func displaySourcePopup(on vc: VCAGImagePCDelegate) {
    let ac = UIAlertController(title: Constants.actionFileTypeHeading,
                               message: Constants.actionFileTypeDescription,
                               preferredStyle: .actionSheet)
    let action_photo = UIAlertAction(title: Constants.camera, style: .default) { _ in
      authorisationStatus(on: vc, attachmentType: .camera)
    }
    let action_library = UIAlertAction(title: Constants.photoLibrary, style: .default) { _ in
      authorisationStatus(on: vc, attachmentType: .photoLibrary)
    }
    let action_cancel = UIAlertAction(title: Constants.cancelBtnTitle, style: .cancel, handler: nil)
    ac.addAction(action_photo)
    ac.addAction(action_library)
    ac.addAction(action_cancel)
    vc.present(ac, animated: true, completion: nil)
  }
  
  static func displayImagePickerWith(on vc: UIViewController, sourceType: UIImagePickerController.SourceType) {
    
  }
  
  
  
  //MARK: - Private
  private enum AttachmentType: String {
    case camera, video, photoLibrary
  }
  
  private struct Constants {
    static let actionFileTypeHeading = "Add a File"
    static let actionFileTypeDescription = "Choose a filetype to add..."
    static let camera = "Camera"
    static let photoLibrary = "Photo Library"
    static let video = "Video"
    static let file = "File"
    static let alertForPhotoLibraryMessage = "App does not have access to your photos. To enable access, tap settings and turn on Photo Library Access."
    static let alertForCameraAccessMessage = "App does not have access to your camera. To enable access, tap settings and turn on Camera."
    static let alertForVideoLibraryMessage = "App does not have access to your video. To enable access, tap settings and turn on Video Library Access."
    static let settingsBtnTitle = "Settings"
    static let cancelBtnTitle = "Cancel"
  }
  
  private static func authorisationStatus(on vc: VCAGImagePCDelegate, attachmentType: AttachmentType){
    let status = PHPhotoLibrary.authorizationStatus()
    switch status {
    case .authorized:
      switch attachmentType {
      case .camera:
        openCamera(on: vc)
      case .video:
        videoLibrary(on: vc)
      case .photoLibrary:
        photoLibrary(on: vc)
      }
    case .denied:
      AGImagePC.addAlertForSettings(on: vc, attachmentType: attachmentType)
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization({ (status) in
        guard status == PHAuthorizationStatus.authorized else {
          AGImagePC.addAlertForSettings(on: vc, attachmentType: attachmentType)
          return
        }
        switch attachmentType {
        case .camera:
          openCamera(on: vc)
        case .video:
          videoLibrary(on: vc)
        case .photoLibrary:
          photoLibrary(on: vc)
        }
      })
    case .restricted:
      AGImagePC.addAlertForSettings(on: vc, attachmentType: attachmentType)
    default:
      break
    }
  }
  
  private static func openCamera(on vc: VCAGImagePCDelegate) {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let ipc = AGImagePC()
      ipc.delegate_agImagePicker = vc
      ipc.sourceType = .camera
      ipc.mediaTypes = [kUTTypeImage as String]
      ipc.allowsEditing = true
      vc.present(ipc, animated: true, completion: nil)
    }
  }
  
  private static func photoLibrary(on vc: VCAGImagePCDelegate) {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let ipc = AGImagePC()
      ipc.delegate_agImagePicker = vc
      ipc.sourceType = .photoLibrary
      ipc.mediaTypes = [kUTTypeImage as String]
      ipc.allowsEditing = true
      vc.present(ipc, animated: true, completion: nil)
    }
  }
  
  private static func videoLibrary(on vc: VCAGImagePCDelegate) {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let ipc = AGImagePC()
      ipc.delegate_agImagePicker = vc
      ipc.sourceType = .photoLibrary
      ipc.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
      ipc.allowsEditing = false
      vc.present(ipc, animated: true, completion: nil)
    }
  }
  
  private static func addAlertForSettings(on vc: UIViewController, attachmentType: AttachmentType){
    var alertTitle: String = ""
    switch attachmentType {
    case .camera:
      alertTitle = Constants.alertForCameraAccessMessage
    case .video:
      alertTitle = Constants.alertForVideoLibraryMessage
    case .photoLibrary:
      alertTitle = Constants.alertForPhotoLibraryMessage
    }
    let ac = UIAlertController (title: alertTitle , message: nil, preferredStyle: .alert)
    let action_setting = UIAlertAction(title: Constants.settingsBtnTitle, style: .destructive) { (_) -> Void in
      let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)
      if let url = settingsUrl {
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
      }
    }
    let action_cancel = UIAlertAction(title: Constants.cancelBtnTitle, style: .default, handler: nil)
    ac.addAction(action_cancel)
    ac.addAction(action_setting)
    vc.present(ac, animated: true, completion: nil)
  }
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - UIImagePickerControllerDelegate
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let editedImage = info[.editedImage] as? UIImage {
      delegate_agImagePicker?.didFinishPickingMedia(self, with: editedImage)
    } else if let orginalImage = info[.originalImage] as? UIImage {
      delegate_agImagePicker?.didFinishPickingMedia(self, with: orginalImage)
    } else {
      delegate_agImagePicker?.didFinishPickingMediaError(self)
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    delegate_agImagePicker?.didCancelPickingMedia(self)
  }
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

