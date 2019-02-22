//
//  FeedVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension FeedVC:
  AGViewDelegate
{
  
}



class FeedVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var sv_main: UIScrollView!
  @IBOutlet weak var v_addPostFloating: FloatingView!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var isFetchPostFirstTime = true
  
  
  
  //MARK: - Storage
  var post: MockPost?
  
  

  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = c_material.grey300
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    //MARK: Component
    sv_main.setupScrollVertical()
    sv_main.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    v_addPostFloating.delegate = self
    let vm_plus = FloatingViewDisplayed()
    vm_plus.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addPostFloating.setupData(with: vm_plus)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(v_state)
    view.bringSubviewToFront(v_addPostFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_state.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchPostList()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = FeedVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPostList
  func fetchPostList() {
    func interactor() {
      if isFetchPostFirstTime {
        isFetchPostFirstTime = false
        v_state.setState(with: .loading, isAnimation: false)
      }
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
      v_state.setState(with: .hidden)
      if let _ = post {
      }
    }
    func presenterError() {
      v_state.setState(with: .hidden)
    }
    interactor()
  }

  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    let vc = PostCreateOutfitVC.vc()
    let nvc = UINavigationController(rootViewController: vc)
    present(nvc, animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
