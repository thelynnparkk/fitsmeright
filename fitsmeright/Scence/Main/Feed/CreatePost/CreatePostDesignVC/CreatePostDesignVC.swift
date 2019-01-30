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
  AGVCInstantiatable
{
  
}



class CreatePostDesignVC: AGIPC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
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
  
  override func prepare() {
    super.prepare()
    
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
    view.backgroundColor = c_material.grey300
    nb?.setupWith(content: .white, bg: c_custom.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    bbi_cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    
    v_createText.txt_main.delegate = self
    
    btn_editText.addTarget(self, action: #selector(editTextButtonPressed), for: .touchUpInside)
    btn_editBrush.addTarget(self, action: #selector(editBrushButtonPressed), for: .touchUpInside)
    btn_editBackground.addTarget(self, action: #selector(editBackgroundButtonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    btn_editBrush.isEnabled = false
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
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
    displayImagePickerAlert()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = CreatePostDesignVC.sb_name
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
  override func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    v_createPost.imgv_background.image = image
    img_backgroundSelected = image
  }
  
  override func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  override func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
