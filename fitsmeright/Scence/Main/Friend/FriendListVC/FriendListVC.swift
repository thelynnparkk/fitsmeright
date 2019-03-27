//
//  FriendListVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 26/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension FriendListVC:
  AGViewDelegate,
  AGVCDelegate,
  AGCADelegate
{
  
}



class FriendListVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_addFriendFloating: FloatingView!
  var collection_friend: UICollectionView!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var adapter_friend: FriendListCA!
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsRelationshipList: [FSRelationship] = []
  var fsUserList: [FSUser] = []
  
  
  
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
    
    
    
    //MARK: Component
    collection_friend = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_friend = FriendListCA(collection: collection_friend)
    adapter_friend.delegate = self
    
    v_addFriendFloating.delegate = self
    let vm_plus = FloatingViewDisplayed()
    vm_plus.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addFriendFloating.setupData(with: vm_plus)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_friend)
    view.addSubview(v_state)
    view.bringSubviewToFront(v_addFriendFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_friend.snp.makeConstraints {
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
    fetchFriend()
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Friends"
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchFriend
  func fetchFriend() {
    func interactor() {
      fsRelationshipList = []
      fsUserList = []
      guard let fsUser = UserDefaults.FSUserDefault.get() else {
        presenterError(code: 0)
        return
      }
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      func fetchRelationship() {
        FSRelationshipWorker.fetchWhere(userOneId: fsUser._documentId) { [weak self] in
          guard let _s = self else { return }
          switch $0.error {
          case .none:
            _s.fsRelationshipList = $0.data.filter({ $0.userRelationStatus == .accept })
            fetchUser()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func fetchUser() {
        let dg = DispatchGroup()
        for i in fsRelationshipList {
          dg.enter()
          FSUserWorker.get(documentId: i._userTwoId) { [weak self] in
            guard let _s = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              _s.fsUserList.append($0.data)
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
      let section = FriendListCADisplayed.Section()
      section.items = fsUserList.map({
        let displayed = IconLabelCCDisplayed()
        displayed.title = $0._displayName
        displayed.imageURL =  $0.imageURL
        return displayed
      })
      
      let displayed = FriendListCADisplayed()
      displayed.sections = [section]
      adapter_friend.setupData(with: displayed)
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
      let vc = FriendSearchVC.vc()
      nc?.pushViewController(vc)
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
    
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

