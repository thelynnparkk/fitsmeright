//
//  FeedVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension FeedVC:
  AGVCInstantiatable,
  AGViewDelegate
{
  
}



class FeedVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var sv_main: UIScrollView!
  @IBOutlet weak var v_post: PostView!
  @IBOutlet weak var v_addPostFloating: FloatingView!
  
  
  
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    view.backgroundColor = c_material.grey300
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    //MARK: Component
    sv_main.setupScrollVertical()
    sv_main.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    v_post.isHidden = true
    v_addPostFloating.delegate = self
    let vm_plus = FloatingViewUC.ViewModel()
    vm_plus.displayedFloating.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addPostFloating.setupData(with: vm_plus)
    view.bringSubviewToFront(v_addPostFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnWillAppear() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    
  }
  
  override func setupDataOnWillAppear() {
    fetchPost()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = FeedVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPost
  func fetchPost() {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      if let post = FMUserDefaults.Post.get() {
        self.post = post
        presenter()
      } else {
        presenterError()
      }
    }
    
    func presenter() {
      if let post = post {
        v_post.isHidden = false
        let vm_post = PostViewUC.ViewModel()
        vm_post.displayedPostDetail.caption = post._string_captionSelected
        vm_post.displayedPostDetail.createdAt = post._string_createdAt
        vm_post.displayedPostDetail.displayName = post._displayName
        vm_post.displayedPost.img_post = post._img_post
        vm_post.displayedPostText.text = post._string_textSelected
        v_post.setupData(with: vm_post)
      }
    }
    
    func presenterError() {
      v_post.isHidden = true
    }
    
    interactor()
    
  }

  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
//    let vc = CreatePostClosetVC.vc
//    let nvc = UINavigationController(rootViewController: vc)
//    present(nvc, animated: true, completion: nil)
    
    
    
    let value = "2"
    switch value {
    case "0":
      let vm = PopupContainerVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let v = CreatePostView()
      v.snp.makeConstraints {
        $0.height.equalTo(v.snp.width)
      }
      if let post = post {
        v_post.isHidden = false
        let vm_createPost = CreatePostViewUC.ViewModel()
        vm_createPost.isMerged = true
        vm_createPost.displayedPost.img_post = post._img_post
        v.setupData(with: vm_createPost)
      }
      vm.displayedContainer.injectedView = v
      vm.displayedContainer.tapDismissal = true
      displayPopupContainer(vm, priority: .common, on: self) { bool in
        
      }
    case "1":
      let vm = PopupContainerVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let v = ClosetFormView()
      v.snp.makeConstraints {
        $0.height.equalTo(50)
      }
      let vm_closetForm = ClosetFormViewUC.ViewModel()
      vm_closetForm.displayedForm.isEditable = true
      vm_closetForm.displayedForm.key = "Key"
      vm_closetForm.displayedForm.placeHolder = "value"
//      vm_closetForm.displayedForm
      v.setupData(with: vm_closetForm)
      vm.displayedContainer.injectedView = v
      vm.displayedContainer.tapDismissal = true
      displayPopupContainer(vm, priority: .common, on: self) { bool in
        
      }
    case "2":
      let vm = PopupListVCUC.ViewModel()
      vm.displayedHeader.style = .large
      vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
      vm.displayedHeader.style = .small
      vm.displayedHeader.subtitle = "subtitle"
      vm.displayedHeader.tint = c_custom.peach
      vm.displayedHeader.title = "title"
      //    vm.displayedFooter.flag_hideCancel = true
      let vm_imageCA = ImageCAUC.ViewModel()
      var urls = [
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495936804.jpg?alt=media&token=3b5070b0-7c2e-4ff7-8e9e-ce79aa4215c2",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495953089.jpg?alt=media&token=e53a9fa4-40c0-4e43-b46b-aade819609e1",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495975284.jpg?alt=media&token=0f7293d4-27a3-4457-ac07-cb7aaba69f8e"
      ]
      urls += urls
      urls += urls
      urls += urls
//      urls = []
//      vm.displayedList.isHideFooter = true
      vm_imageCA.displayedItems = urls.compactMap({
        let vm = ImageCCUC.ViewModel()
        vm.displayedImage.imageUrl = URL(string: $0)
        return vm
      })
      //      vm.displayedFooter.kind = UICollectionView.elementKindSectionFooter
      vm_imageCA.displayedFooter.title = "\(vm_imageCA.displayedItems.count) items"
      vm.displayedList.adapter = ImageCA.self
      vm.displayedList.viewModel = vm_imageCA
      vm.displayedList.tapDismissal = true
      displayPopupList(vm, priority: .common, on: self) { bool in
        
      }
    default:
      break
    }
    
    

    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
