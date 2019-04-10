//
//  PostListVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit


import FirebaseFirestore
import CodableFirebase



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
  var bbi_notification: UIBarButtonItem!
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
  var fsRelationshipList: [FSRelationship] = []
  
  
  
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
//    nb?.setupLargeTitlesWith(content: .white, bg: c_custom.peach)
    bbi_notification = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_noti"), style: .plain, target: self, action: #selector(buttonPressed))
    ni.rightBarButtonItems = [bbi_notification]
    
    
    
    
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
    
    view.insertSubview(collection_post, at: 0)
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
    fetchNotification()
  }
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    let vc = NotificationVC.vc()
    let nvc = UINavigationController(rootViewController: vc)
    nvc.modalTransitionStyle = .crossDissolve
    present(nvc, animated: true)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Closettó"
  }
  
  
  
  //MARK: - Private
  
  
  //MARK: - VIP - FetchNotification
  func fetchNotification() {
    func interactor() {
      fsRelationshipList = []
      v_state.setState(with: .loading, isAnimation: false)
      guard let fsUser = UserDefaults.FSUserDefault.get() else {
        presenterError(code: 0)
        return
      }
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      func fetchRelationship() {
        FSRelationshipWorker.fetchWhere(userTwoId: fsUser._documentId) { [weak self] in
          guard let _s = self else { return }
          switch $0.error {
          case .none:
            _s.fsRelationshipList = $0.data.filter({ $0.userRelationStatus == .request })
            presenter()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      fetchRelationship()
    }
    func presenter() {
      v_state.setState(with: .hidden, isAnimation: false)
      if fsRelationshipList.isEmpty {
        bbi_notification = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_noti"), style: .plain, target: self, action: #selector(buttonPressed))
        ni.rightBarButtonItems = [bbi_notification]
      } else {
        bbi_notification = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_noti_yes").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(buttonPressed))
        ni.rightBarButtonItems = [bbi_notification]
      }
    }
    func presenterError(code: Int) {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchPostList
  func fetchPostList() {
    var postList: [Post] = []
    var fsPostList: [FSPost] = []
    var fsUserList: [FSUser] = []
    var fsPostLikeList: [FSPostLike] = []
    func interactor() {
      if isFetchFeedFirstTime {
        isFetchFeedFirstTime = false
        v_state.setState(with: .loading, isAnimation: false)
      }
      let fsUser = UserDefaults.FSUserDefault.get()!
      worker(userId: fsUser._documentId)
    }
    func worker(userId: String) {
      var userRelateIdList: [String] = []
      userRelateIdList.append(userId)
      func fetchRelationship() {
        FSRelationshipWorker.fetchWhere(userOneId: userId) {
          switch $0.error {
          case .none:
            let fsRelationshipList = $0.data.filter({ $0.userRelationStatus == .accept })
            userRelateIdList += fsRelationshipList.map({ $0._userTwoId })
            fetchPost()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func fetchPost() {
        let dg = DispatchGroup()
        for i in userRelateIdList {
          dg.enter()
          FSPostWorker.fetchWhere(userId: i) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsPostList += $0.data
              fsPostList.sort(by: { $0._updatedAt.dateValue() >= $1._updatedAt.dateValue() })
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          fetchUser()
        }
      }
      func fetchUser() {
        let dg = DispatchGroup()
        for i in userRelateIdList {
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
          fetchPostLike()
        }
      }
      func fetchPostLike() {
        let dg = DispatchGroup()
        for i in fsPostList {
          dg.enter()
          FSPostLikeWorker.fetchWhere(postId: i._documentId) {[weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsPostLikeList += $0.data
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          presenter()
        }
      }
      fetchRelationship()
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
        for l in fsPostLikeList {
          if l._postId == p._documentId {
            post.fsPostLikeList.append(l)
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
        displayed.userImageURL = $0._fsUser.getValidImageURL
        displayed.displayName = $0._fsUser.displayName
        displayed.username = $0._fsUser.username
        displayed.isLiked = $0.fsPostLikeList.contains(where: {
          $0._userId == UserDefaults.FSUserDefault.get()!._documentId
        })
        displayed.like = "\($0.fsPostLikeList.count)"
        displayed.comment = "0"
        return displayed
      })
      displayed.sections = [section]
      adapter_post.setupData(with: displayed)
    }
    func presenterError(code: Int) {
      v_state.setState(with: .hidden)
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - AddPostLike
  func addPostLike(indexPath: IndexPath) {
    func interactor() {
      worker(postId: postList[indexPath.row].fsPost!._documentId,
             userId: UserDefaults.FSUserDefault.get()!._documentId)
    }
    func worker(postId: String, userId: String) {
      func getPostLike() {
        FSPostLikeWorker.fetchWhere(postId: postId, userId: userId) {
          switch $0.error {
          case .none:
            if $0.data.isEmpty {
              addPostLike()
            }
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func addPostLike() {
        let fsPostLike = FSPostLike()
        fsPostLike.postId = postList[indexPath.row].fsPost?.documentId
        fsPostLike.userId = UserDefaults.FSUserDefault.get()?.documentId
        fsPostLike.updatedAt = Timestamp(date: Date())
        FSPostLikeWorker.add(fsPostLike: fsPostLike) { [weak self] in
          guard let _s = self else { return }
          switch $0.error {
          case .none:
            fsPostLike.documentId = $0.ref?.documentID
            _s.postList[indexPath.row].fsPostLikeList.append(fsPostLike)
            presenter()
          case let .some(e):
            print(e.localizedDescription)
          }
        }
      }
      getPostLike()
    }
    func presenter() {
      
    }
    func presenterError(code: Int) {
      
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - DeletePostLike
  func deletePostLike(indexPath: IndexPath) {
    func interactor() {
      worker(postId: postList[indexPath.row].fsPost!._documentId,
             userId: UserDefaults.FSUserDefault.get()!._documentId)
    }
    func worker(postId: String, userId: String) {
      FSPostLikeWorker.fetchWhere(postId: postId, userId: userId) { [weak self] in
        guard let _s = self else { return }
        switch $0.error {
        case .none:
          _s.postList[indexPath.row].fsPostLikeList.removeAll(where: {
            ($0._postId == postId) && ($0._userId == userId)
          })
          $0.data.first?.ref?.delete()
        case let .some(e):
          presenterError(code: 0)
          print(e.localizedDescription)
        }
      }
      presenter()
    }
    func presenter() {
      
    }
    func presenterError(code: Int) {
      
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
        nvc?.pushViewController(vc)
      case let .like(bool):
        print(action)
        if bool {
          addPostLike(indexPath: indexPath)
        } else {
          deletePostLike(indexPath: indexPath)
        }
      case .profile:
        let vc = ProfileVC.vc()
        vc.fsUser = postList[indexPath.row].fsUser
        nvc?.pushViewController(vc, animated: true)
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
