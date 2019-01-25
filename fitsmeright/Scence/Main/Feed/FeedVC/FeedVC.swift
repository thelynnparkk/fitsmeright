//
//  FeedVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension FeedVC:
  AGVCInstantiatable
{
  
}



class FeedVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var sv_main: UIScrollView!
  @IBOutlet weak var btn_createPost: UIButton!
  @IBOutlet weak var v_post: PostView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var post: MockPost?
  
  
  
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
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    sv_main.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    btn_createPost.addTarget(self, action: #selector(createPostButtonPressed), for: .touchUpInside)
    v_post.isHidden = true
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    
  }
  
  func fetchPostData() {
    if let post = FMUserDefaults.Post.get() {
      self.post = post
      displayFetchPostData()
    } else {
      displayFetchPostDataError()
    }
  }
  
  
  
  //MARK: - Event
  @objc
  func createPostButtonPressed(_ sender: UIButton) {
//    let vc = CreatePostVC.vc
//    let nvc = UINavigationController(rootViewController: vc)
//    present(nvc, animated: true, completion: nil)
    let vm = PopupContainerVCUC.ViewModel()
    vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
    vm.displayedHeader.style = .small
    vm.displayedHeader.subtitle = "subtitle"
    vm.displayedHeader.tint = c_custom.peach
    vm.displayedHeader.title = "title"
//    vm.displayedFooter.flag_hideCancel = true
    displayPopupContainer(vm, priority: .common, on: self) { bool in
      
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = FeedVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  func displayFetchPostData() {
    if let post = post {
      v_post.isHidden = false
      let vm_post = PostViewUC.ViewModel()
      vm_post.displayedPost = post
      v_post.setupData(with: vm_post)
    }
  }
  
  func displayFetchPostDataError() {
    v_post.isHidden = true
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
