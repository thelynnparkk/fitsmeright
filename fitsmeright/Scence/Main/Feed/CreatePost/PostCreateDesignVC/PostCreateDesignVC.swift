//
//  CreatePostEditVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension PostCreateDesignVC:
  UITextFieldDelegate,
  AGVCInstantiatable
{
  
}



class PostCreateDesignVC: AGVC {
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
  var img_clothListSelected: [UIImage] = []
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
    fetchPost()
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = PostCreateInfoVC.vc
    vc.img_clothListSelected = img_clothListSelected
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
    ni.title = PostCreateDesignVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPost
  func fetchPost() {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      present()
    }
    
    func present() {
      let vm = CreatePostViewUC.ViewModel()
      vm.displayedCreatePost.img_clothListSelected = img_clothListSelected
      v_createPost.setupData(with: vm)
    }
    
    interactor()
    
  }
  
  
  
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
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    img_backgroundSelected = image
    let vm = CreatePostViewUC.ViewModel()
    vm.displayedCreatePost.img_background = img_backgroundSelected
    v_createPost.setupData(with: vm)
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
