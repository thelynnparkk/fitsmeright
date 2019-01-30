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
  
  
  
  //MARK: - Enum
  
  
  
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
  var img_clothListSelected: [UIImage] = []
  var img_backgroundSelected: UIImage?
  var string_textSelected: String?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
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
    
    txt_caption.text = ""
    txt_caption.placeholder = "Add your caption."
    txt_caption.delegate = self
    
    v_createText.isUserInteractionEnabled = false
    v_createPost.isUserInteractionEnabled = false
    
    btn_post.addTarget(self, action: #selector(postButtonPresed), for: .touchUpInside)
    
    
    
    //MARK: Other
    
    
    
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
  func postButtonPresed(_ sender: UIButton) {
    insertPost()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = CreatePostInfoVC.sb_name
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
      let vm_createPost = CreatePostViewUC.ViewModel()
      vm_createPost.displayedCreatePost.img_clothListSelected = img_clothListSelected
      vm_createPost.displayedCreatePost.img_background = img_backgroundSelected
      v_createPost.setupData(with: vm_createPost)
      if let img = img_backgroundSelected {
        v_createPost.setupBackgroundData(image: img)
      }
      if let string = string_textSelected {
        v_createText.setupTextData(text: string)
      }
    }
    
    interactor()
    
  }
  
  func insertPost() {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      presentInsertPost()
    }
    
    func presentInsertPost() {
      let post = MockPost()
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      post.displayName = fsUser._displayName
      post.img_clothSelected = img_clothListSelected
      post.img_backgroundSelected = img_backgroundSelected
      post.string_textSelected = string_textSelected
      post.string_captionSelected = txt_caption.text ?? ""
      post.string_createdAt = Date().toString()
      FMUserDefaults.Post.set(data: post)
      dismiss(animated: true)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

