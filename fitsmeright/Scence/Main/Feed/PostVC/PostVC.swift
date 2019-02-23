//
//  PostVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension PostVC:
  AGViewDelegate,
  AGCADelegate
{
  
}



class PostVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var collection_post: UICollectionView!
  var adapter_post: PostCA!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var postSelected: Post?
  
  
  
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
    
    
    
    //MARK: Component
    collection_post = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_post = PostCA(collection: collection_post)
    adapter_post.delegate = self
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_post)
    view.addSubview(v_state)
    
    
    
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
    fetchPost()
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPost
  func fetchPost() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      print("\(postSelected!._fsPost._caption)")
      worker()
    }
    func worker() {
      if let post = postSelected {
        presenter(post: post)
      } else {
        presenterError()
      }
    }
    func presenter(post: Post) {
      v_state.setState(with: .hidden, isAnimation: true)
      let section_post = PostCADisplayed.Section()
      let displayed_post = PostHeaderCCDisplayed()
      displayed_post.outfitImageURL = post._fsPost.imageURL
      displayed_post.userImageURL = post._fsUser.imageURL
      displayed_post.displayName = post._fsUser.displayName
      displayed_post.username = post._fsUser.username
      displayed_post.isLiked = false
      displayed_post.like = "\(post._fsPost._likes)"
      displayed_post.caption = post._fsPost._caption
      section_post.items = [displayed_post]
      let displayed = PostCADisplayed()
      displayed.sections = [section_post]
      adapter_post.setupData(with: displayed)
    }
    func presenterError() {
      v_state.setState(with: .error, isAnimation: true)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
    case is StateView:
      if let state = action as? StateView.State {
        switch state {
        case .hidden:
          break
        case .loading:
          break
        case .noResults:
          break
        case .noConnection:
          break
        case .error:
          nc?.popViewController()
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
//    if let action = action as? PostListCA.Action {
//      switch action {
//      case .tap:
//        print("tap \(indexPath)")
//        let vc = PostVC.vc()
//        vc.postSelected = postList[indexPath.row]
//        nc?.pushViewController(vc)
//      case .doubleTap:
//        print("doubleTap \(indexPath)")
//      }
//    }
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

