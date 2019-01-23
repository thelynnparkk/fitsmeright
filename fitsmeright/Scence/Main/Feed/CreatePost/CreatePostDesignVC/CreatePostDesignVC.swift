//
//  CreatePostEditVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreatePostDesignVC:
  UITextFieldDelegate,
  AGVCInstantiatable,
  AGImagePCDelegate
{
  
}



class CreatePostDesignVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "CreatePostDesignVC"
  static var vc_name: String = "CreatePostDesignVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var v_createText: CreateTextView!
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var btn_editText: UIButton!
  @IBOutlet weak var btn_editBrush: UIButton!
  @IBOutlet weak var btn_editBackground: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var img_clothSelected: [UIImage] = []
  var img_backgroundSelected: UIImage?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
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
    let nb = navigationController?.navigationBar
    let c = UIColor.Custom.self
    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    let ni = navigationItem
    ni.title = CreatePostDesignVC.sb_name
    
    
    
    //MARK: Component
    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    
    v_createText.txt_main.delegate = self
    
    btn_editText.addTarget(self, action: #selector(editTextButtonPressed), for: .touchUpInside)
    btn_editBrush.addTarget(self, action: #selector(editBrushButtonPressed), for: .touchUpInside)
    btn_editBackground.addTarget(self, action: #selector(editBackgroundButtonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    btn_editBrush.isEnabled = false
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    setupPostData()
  }
  
  func setupPostData() {
    v_createPost.setupClothData(images: img_clothSelected)
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = CreatePostInfoVC.vc
    vc.img_clothSelected = img_clothSelected
    vc.img_backgroundSelected = img_backgroundSelected
    vc.string_textSelected = v_createText.txt_main.text
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func editTextButtonPressed(_ sender: UIButton) {
    v_createText.startEdit()
  }
  
  @objc
  func editBrushButtonPressed(_ sender: UIButton) {
    
  }
  
  @objc
  func editBackgroundButtonPressed(_ sender: UIButton) {
    AGImagePC.displaySourcePopup(on: self)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - UITextFieldDelegate
  func textFieldDidBeginEditing(_ textField: UITextField) {
    switch textField {
    case v_createText.txt_main:
      v_createText.displayStartEdit(onComplete: {
        
      })
    default:
      break
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField {
    case v_createText.txt_main:
      v_createText.displayStopEdit(onComplete: {
        
      })
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - AGImagePickerDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, with image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    v_createPost.imgv_background.image = image
    img_backgroundSelected = image
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
