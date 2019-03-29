//
//  PostVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
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
  var bbi_edit: UIBarButtonItem!
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
    view.backgroundColor = .white
    
    if let postSelected = postSelected {
      if postSelected.fsUser?.documentId == UserDefaults.FSUserDefault.get()?.documentId {
        bbi_edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(buttonPressed))
        ni.rightBarButtonItems = [bbi_edit]
      }
    }
    
    
    
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
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      _s.fetchPost()
    }
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    let vc = PostFormVC.vc()
    vc.postSelected = postSelected
    nc?.pushViewController(vc, animated: true)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPost
  func fetchPost() {
    var fsPostClosetList: [FSPostCloset] = []
    var fsClosetList: [FSCloset] = []
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
//      ถ้าไม่มีโพสส่งเข้ามาให้โชว์ error
      guard let post = postSelected else {
        presenterError()
        return
      }
      worker(post: post)
    }
    func worker(post: Post) {
      func fetchPostCloset() {
        FSPostClosetWorker.fetchWhere(postId: post._fsPost._documentId) { [weak self] in
          guard let _ = self else { return }
          switch $0.error {
          case .none:
            fsPostClosetList = $0.data
            fetchCloset(fsPostClosetList: fsPostClosetList)
          case let .some(e):
            print(e.localizedDescription)
            presenterError()
          }
        }
      }
      func fetchCloset(fsPostClosetList: [FSPostCloset]) {
        let dg = DispatchGroup()
        for i in fsPostClosetList {
          dg.enter()
          FSClosetWorker.get(documentId: i._closetId) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsClosetList.append($0.data)
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          presenter(post: post)
        }
      }
      fetchPostCloset()
    }
    func presenter(post: Post) {
      v_state.setState(with: .hidden, isAnimation: true)
      for pc in fsPostClosetList {
        for c in fsClosetList {
          if pc._closetId == c._documentId {
            let postCloset = PostCloset()
            postCloset.fsPostCloset = pc
            postCloset.fsCloset = c
            post.postClosetList.append(postCloset)
          }
        }
      }
      self.postSelected = post
      let section_post = PostCADisplayed.Section()
      let displayed_post = PostHeaderCCDisplayed()
      displayed_post.outfitImageURL = post._fsPost.imageURL
      displayed_post.userImageURL = post._fsUser.imageURL
      displayed_post.displayName = post._fsUser.displayName
      displayed_post.username = post._fsUser.username
      displayed_post.isLiked = false
      displayed_post.like = "\(post._fsPost._likes)"
      displayed_post.caption = post._fsPost._caption
      displayed_post.postClostList = post.postClosetList
      section_post.items = [displayed_post]
      let section_outfitItem = PostCADisplayed.Section()
      let item_outfitItem = OutfitItemXCCDisplayed()
      item_outfitItem.items = post.postClosetList.map({
        let displayed = OutfitItemCCDisplayed()
        displayed.imageURL = $0.fsCloset?.imageURL
        return displayed
      })
      let header_outfitItem = LabelCRVDisplayed()
      header_outfitItem.title = "Items"
      section_outfitItem.header = header_outfitItem
      section_outfitItem.items = [item_outfitItem]
      let displayed = PostCADisplayed()
      displayed.sections = [section_post, section_outfitItem]
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
    if let action = action as? PostCA.Action {
      switch action {
      case .like:
        break
      case .items:
        print(indexPath)
        let vc = ClosetVC.vc()
        vc.fsCloset = postSelected!.postClosetList[indexPath.row]._fsCloset
        vc.closetCategory = postSelected!.postClosetList[indexPath.row]._fsCloset.closetCategory
        vc.isEditable = false
        navigationController?.pushViewController(vc)
      case .profile:
        let vc = ProfileVC.vc()
        vc.fsUser = postSelected?._fsUser
        nc?.pushViewController(vc, animated: true)
      }
    }
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

