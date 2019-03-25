//
//  PostListVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension PostListVC:
  AGViewDelegate,
  AGVCDelegate,
  AGCADelegate
{
  
}



class PostListVC: AGVC {
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_addPostFloating: FloatingView!
  var collection_post: UICollectionView!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var adapter_post: PostListCA!
  
  
  
  //MARK: - Flag
  var isFetchFeedFirstTime = true
  
  
  
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
    view.backgroundColor = c_material.white
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    collection_post = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_post = PostListCA(collection: collection_post)
    adapter_post.delegate = self
    
    v_addPostFloating.delegate = self
    let vm_plus = FloatingViewDisplayed()
    vm_plus.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addPostFloating.setupData(with: vm_plus)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_post)
    view.addSubview(v_state)
    view.bringSubviewToFront(v_addPostFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_post.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    
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
    ni.title = "Closettó"
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPostList
  func fetchPostList() {
    var postList: [Post] = []
    var fsPostList: [FSPost] = []
    var fsUserList: [FSUser] = []
    func interactor() {
      if isFetchFeedFirstTime {
        isFetchFeedFirstTime = false
        v_state.setState(with: .loading, isAnimation: false)
      }
      let fsUser = UserDefaults.FSUserDefault.get()!
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
      let displayed = PostListCADisplayed()
      let section = PostListCADisplayed.Section()
      section.items = postList.map({
        let displayed = PostCCDisplayed()
        displayed.outfitImageURL = $0._fsPost.imageURL
        displayed.userImageURL = $0._fsUser.imageURL
        displayed.displayName = $0._fsUser.displayName
        displayed.username = $0._fsUser.username
        displayed.isLiked = false
        displayed.like = "\($0._fsPost._likes)"
        displayed.comment = "0"
        return displayed
      })
      displayed.sections = [section]
      adapter_post.setupData(with: displayed)
    }
    func presenterError() {
      v_state.setState(with: .hidden)
    }
    interactor()
  }

  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
    case is FloatingView:
      let vc = PostCreateOutfitVC.vc()
      vc.delegate_agvc = self
      let nvc = UINavigationController(rootViewController: vc)
      present(nvc, animated: true, completion: nil)
    case is StateView:
      switch action as! StateView.State {
      case .hidden:
        break
      case .loading:
        break
      case .noResults:
        break
      case .noConnection:
        break
      case .error:
        break
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    if let action = action as? PostListCA.Action {
      switch action {
      case .tap:
        print("tap \(indexPath)")
        let vc = PostVC.vc()
        vc.postSelected = postList[indexPath.row]
        nc?.pushViewController(vc)
      case .doubleTap:
        print("doubleTap \(indexPath)")
      }
    }
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
