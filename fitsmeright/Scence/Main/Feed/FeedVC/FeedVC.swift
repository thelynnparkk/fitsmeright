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
    view.backgroundColor = c_material.grey300
    
    
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
        vm_post.displayedPost = post
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
    let vc = CreatePostVC.vc
    let nvc = UINavigationController(rootViewController: vc)
    present(nvc, animated: true, completion: nil)
    
    //    let vm = PopupContainerVCUC.ViewModel()
    //    vm.displayedHeader.style = .large
    //    vm.displayedHeader.icon = UIImage(color: c_custom.peach, size: .less)
    //    vm.displayedHeader.style = .small
    //    vm.displayedHeader.subtitle = "subtitle"
    //    vm.displayedHeader.tint = c_custom.peach
    //    vm.displayedHeader.title = "title"
    //    vm.displayedContainer.tapDismissal = true
    ////    vm.displayedFooter.flag_hideCancel = true
    //    displayPopupContainer(vm, priority: .common, on: self) { bool in
    //
    //    }
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
