//
//  CreatePostInfoVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SwiftDate



extension CreatePostInfoVC:
  AGVCInstantiatable,
  UITextFieldDelegate
{
  
}



class CreatePostInfoVC: AGVC {
  
  //MARK: - AGInstantiatable
  static var sb_name: String = "CreatePostInfoVC"
  static var vc_name: String = "CreatePostInfoVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  @IBOutlet weak var txt_caption: UITextField!
  @IBOutlet weak var v_createText: CreateTextView!
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var btn_post: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var img_clothSelected: [UIImage] = []
  var img_backgroundSelected: UIImage?
  var string_textSelected: String?
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
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
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
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
    let nb = navigationController?.navigationBar
    let c = R.Value.Color.self
    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    let ni = navigationItem
    ni.title = CreatePostInfoVC.sb_name
    
    
    //MARK: UI
    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    
    txt_caption.text = ""
    txt_caption.placeholder = "Add your caption."
    txt_caption.delegate = self
    
    v_createText.isUserInteractionEnabled = false
    v_createPost.isUserInteractionEnabled = false
    
    btn_post.addTarget(self, action: #selector(postButtonPresed), for: .touchUpInside)
    
    
    
    //MARK: Misc

    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    setupPostData()
  }
  
  func setupPostData() {
    v_createPost.setupClothData(images: img_clothSelected)
    if let img = img_backgroundSelected {
      v_createPost.setupBackgroundData(image: img)
    }
    if let string = string_textSelected {
      v_createText.setupTextData(text: string)
    }
  }
  
  
  
  //MARK: - Event
  @objc
  func postButtonPresed(_ sender: UIButton) {
    let post = MockPost()
    post.img_clothSelected = img_clothSelected
    post.img_backgroundSelected = img_backgroundSelected
    post.string_textSelected = string_textSelected
    post.string_captionSelected = txt_caption.text ?? ""
    post.string_createdAt = Date().toString()
    FMUserDefaults.Post.set(data: post)
    dismiss(animated: true)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

