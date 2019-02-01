//
//  PostCreateInfoVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SwiftDate
import AVFoundation



extension PostCreateInfoVC:
  AGVCInstantiatable,
  UITextFieldDelegate
{
  
}



class PostCreateInfoVC: AGVC {
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
    ni.title = PostCreateInfoVC.sb_name
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
      let vm_createText = CreateTextViewUC.ViewModel()
      vm_createText.displayedCreateText.text = string_textSelected
      v_createText.setupData(with: vm_createText)
    }
    
    interactor()
    
  }
  
  func insertPost() {
    
    func interactor() {
      guard let backgroud = img_backgroundSelected, img_clothListSelected.count == 4 else {
        return
      }
      let side = CGFloat(500)
      let side_clothList = CGFloat(side * 0.8)
      let space = CGFloat(20)
      let side_cloth = (side_clothList - space) / 2
      
      let rect_container = CGRect(origin: .zero, size: CGSize(side: side))
      let rect_clothList = rect_container.insetBy(dx: (side - side_clothList) / 2, dy: (side - side_clothList) / 2)
      let rect_cloth = CGRect(origin: rect_clothList.origin, size: CGSize(side: side_cloth))
      
      let rect_cloth01 = rect_cloth
      var rect_cloth02 = rect_cloth
      var rect_cloth03 = rect_cloth
      var rect_cloth04 = rect_cloth
      
      rect_cloth02.origin.x += rect_cloth.size.width + space
      rect_cloth03.origin.y += rect_cloth.size.height + space
      rect_cloth04.origin.x += rect_cloth.size.width + space
      rect_cloth04.origin.y += rect_cloth.size.height + space
      
      let rect_containerByAspectRatio = AVMakeRect(aspectRatio: backgroud.size, insideRect: rect_container)
      let rect_cloth01ByAspectRatio = AVMakeRect(aspectRatio: img_clothListSelected[0].size, insideRect: rect_cloth01)
      let rect_cloth02ByAspectRatio = AVMakeRect(aspectRatio: img_clothListSelected[1].size, insideRect: rect_cloth02)
      let rect_cloth03ByAspectRatio = AVMakeRect(aspectRatio: img_clothListSelected[2].size, insideRect: rect_cloth03)
      let rect_cloth04ByAspectRatio = AVMakeRect(aspectRatio: img_clothListSelected[3].size, insideRect: rect_cloth04)
      
      UIGraphicsBeginImageContext(rect_container.size)
      
      img_backgroundSelected!.draw(in: rect_containerByAspectRatio)
      img_clothListSelected[0].draw(in: rect_cloth01ByAspectRatio)
      img_clothListSelected[1].draw(in: rect_cloth02ByAspectRatio)
      img_clothListSelected[2].draw(in: rect_cloth03ByAspectRatio)
      img_clothListSelected[3].draw(in: rect_cloth04ByAspectRatio)
      
      let img_result = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext()
      worker(image: img_result)
    }
    
    func worker(image: UIImage) {
      presentInsertPost(image: image)
    }
    
    func presentInsertPost(image: UIImage) {
      
      v_createText.isHidden = true
      v_createPost.imgv_01.isHidden = true
      v_createPost.imgv_02.isHidden = true
      v_createPost.imgv_03.isHidden = true
      v_createPost.imgv_04.isHidden = true
      
      let vm = CreatePostViewUC.ViewModel()
      vm.displayedCreatePost.img_clothListSelected = Array(repeating: UIImage(), count: 4)
      vm.displayedCreatePost.img_background = image
      v_createPost.setupData(with: vm)
      
      let post = MockPost()
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      post.displayName = fsUser._displayName
      post.img_post = image
      post.string_textSelected = string_textSelected
      post.string_captionSelected = txt_caption.text ?? ""
      post.string_createdAt = Date().toString()
      FMUserDefaults.Post.set(data: post)
      dismiss(animated: true)
    }
    
    interactor()
    
  }
  
  func mergeImages(imageView: UIImageView) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0.0)
    imageView.superview!.layer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

