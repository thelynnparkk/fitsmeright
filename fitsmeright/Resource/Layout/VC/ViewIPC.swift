//
//  ViewIPC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import MobileCoreServices
import Photos



@objc protocol ViewIPCDelegate: class {
  @objc optional func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage)
  @objc optional func didFinishPickingMediaError(_ picker: UIImagePickerController)
  @objc optional func didCancelPickingMedia(_ picker: UIImagePickerController)
}



extension ViewIPCDelegate {
  
  //MARK: - Implement
  //  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
  //    print("A")
  //  }
  //
  //  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
  //    print("B")
  //  }
  //
  //  func didCancelPickingMedia(_ picker: UIImagePickerController) {
  //    print("C")
  //  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
}



extension ViewIPC:
  Preparable,
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
  
  
  
  //MARK: - Initial
  //  convenience init() {
  //    self.init(nibName: nil, bundle: nil)
  //  }
  //
  //
  //  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
  //    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  //    setupInit()
  //
  //  }
  //
  //  required public init?(coder aDecoder: NSCoder) {
  //    super.init(coder: aDecoder)
  //    setupInit()
  //
  //  }
  
  deinit {
    setupDeinit()
  }
  
  func setupInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  func setupPrepare() {
    
  }
  
  func setupDeinit() {
    
  }
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    nb?.setupWith(content: .white, bg: .black, isTranslucent: false)
    delegate = self
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    //MARK: Data
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  
  
  //MARK: - SetupView
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - UIImagePickerControllerDelegate
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let editedImage = info[.editedImage] as? UIImage {
      delegate_viewIPC?.didFinishPickingMedia?(self, image: editedImage)
    } else if let orginalImage = info[.originalImage] as? UIImage {
      delegate_viewIPC?.didFinishPickingMedia?(self, image: orginalImage)
    } else {
      delegate_viewIPC?.didFinishPickingMediaError?(self)
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    delegate_viewIPC?.didCancelPickingMedia?(self)
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

