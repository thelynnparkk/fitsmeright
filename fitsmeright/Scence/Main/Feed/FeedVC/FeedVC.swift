//
//  FeedVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension FeedVC:
  AGViewDelegate,
  AGVCDelegate
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
  var postList: [Post] = []
  
  

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
    var postList: [Post] = []
    var fsPostList: [FSPost] = []
    var fsUserList: [FSUser] = []
    func interactor() {
      if isFetchPostFirstTime {
        isFetchPostFirstTime = false
        v_state.setState(with: .loading, isAnimation: false)
      }
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      worker(userId: fsUser._documentId)
    }
    func worker(userId: String) {
      let users = [userId]
      func fetchPost() {
        let dg = DispatchGroup()
        for i in users {
          dg.enter()
          FSPostWorker.fetchWhere(userId: i) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsPostList += $0.data
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          fetchUser(users: users)
        }
      }
      func fetchUser(users: [String]) {
        let dg = DispatchGroup()
        for i in users {
          dg.enter()
          FSUserWorker.get(documentId: i) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsUserList.append($0.data)
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          presenter()
        }
      }
      fetchPost()
    }
    func presenter() {
      v_state.setState(with: .hidden)
      for p in fsPostList {
        let post = Post()
        post.fsPost = p
        for u in fsUserList {
          if p._userId == u._documentId {
            post.fsUser = u
          }
        }
        postList.append(post)
      }
      self.postList = postList
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
    vc.delegate_agvc = self
    let nvc = UINavigationController(rootViewController: vc)
    present(nvc, animated: true, completion: nil)
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    switch vc {
    case is PostCreateOutfitVC:
      vc.dismiss(animated: true) { [weak self] in
        guard let _s = self else { return }
        _s.fetchPostList()
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
