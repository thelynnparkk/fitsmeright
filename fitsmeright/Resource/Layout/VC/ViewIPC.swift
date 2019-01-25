//
//  ViewIPC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import MobileCoreServices
import Photos



protocol ViewIPCDelegate: class {
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage)
  func didFinishPickingMediaError(_ picker: UIImagePickerController)
  func didCancelPickingMedia(_ picker: UIImagePickerController)
}



extension ViewIPC:
  LifeCyclable,
  DispatchQueueable,
  Colorable,
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate
{
  
}



class ViewIPC: UIImagePickerController {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate_viewIPC: ViewIPCDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  //  convenience init() {
//    self.init(nibName: nil, bundle: nil)
//  }
//
//
//  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    onInit()
//
//  }
//
//  required public init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    onInit()
//
//  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override var childForStatusBarHidden: UIViewController? {
    return nil
  }
  
  
  
  //MARK: - Life cycle
  func onInit() {
    
  }
  
  func prepare() {
    
  }
  
  func prepareToDeinit() {
    
  }
  
  func onDeinit() {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupViewOnWillAppear()
    setupDataOnWillAppear()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupViewOnDidAppear()
    setupDataOnDidAppear()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    setupViewOnWillDisappear()
    setupDataOnWillDisappear()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    setupViewOnDidDisappear()
    setupDataOnDidDisappear()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupViewOnDidLayoutSubviews()
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnViewDidLoad() {
    //MARK: Core
    nb?.setupWith(content: .white, bg: .black, isTranslucent: false)
    delegate = self
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
  }
  
  func setupViewOnWillAppear() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
  }
  
  func setupViewOnDidAppear() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
  }
  
  func setupViewOnWillDisappear() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
  }
  
  func setupViewOnDidDisappear() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
  }
  
  func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  func setupDataOnWillAppear() {
    
  }
  
  func setupDataOnDidAppear() {
    
  }
  
  func setupDataOnWillDisappear() {
    
  }
  
  func setupDataOnDidDisappear() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - UIImagePickerControllerDelegate
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let editedImage = info[.editedImage] as? UIImage {
      delegate_viewIPC?.didFinishPickingMedia(self, image: editedImage)
    } else if let orginalImage = info[.originalImage] as? UIImage {
      delegate_viewIPC?.didFinishPickingMedia(self, image: orginalImage)
    } else {
      delegate_viewIPC?.didFinishPickingMediaError(self)
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    delegate_viewIPC?.didCancelPickingMedia(self)
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

