//
//  NotificationVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 28/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift


import FirebaseStorage
import FirebaseFirestore



extension NotificationVC:
  AGViewDelegate,
  AGVCDelegate,
  AGCADelegate
{
  
}



class NotificationVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_close: UIBarButtonItem!
  var collection_notification: UICollectionView!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var adapter_notification: NotificationCA!
  
  
  
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
    fetchNotification()
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
    bbi_close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButtonPressed))
    ni.rightBarButtonItems = [bbi_close]
    
    
    
    //MARK: Component
    view.setupViewFrame()
    
    collection_notification = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_notification = NotificationCA(collection: collection_notification)
    adapter_notification.delegate = self
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_notification)
    view.addSubview(v_state)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_notification.snp.makeConstraints {
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
    fetchNotification()
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Notification"
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchNotification
  func fetchNotification() {
    func interactor() {
      fsRelationshipList = []
      fsUserList = []
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
          FSUserWorker.get(documentId: i._userOneId) { [weak self] in
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
      v_state.setState(with: .hidden, isAnimation: false)
      let section = NotificationCADisplayed.Section()
      section.items = fsUserList.map({
        let displayed = FriendRequestCCDisplayed()
        displayed.title = $0._displayName
        displayed.description = "wants to be your friend."
        displayed.imageURL =  $0.imageURL
        return displayed
      })
      let displayed = NotificationCADisplayed()
      displayed.sections = [section]
      adapter_notification.setupData(with: displayed)
    }
    func presenterError(code: Int) {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  var requestingRelationList: [IndexPath] = []
  //MARK: - VIP - AddRelation
  func addRelation(_ indexPath: IndexPath) {
    func interactor() {
      guard !requestingRelationList.contains(indexPath) else {
        return
      }
      requestingRelationList.append(indexPath)
      worker(fsRelationship: fsRelationshipList[indexPath.row])
    }
    func worker(fsRelationship: FSRelationship) {
//      let fsRelationship = FSRelationship()
//      fsRelationship.userOneId = UserDefaults.FSUserDefault.get()?.documentId
//      fsRelationship.userTwoId = fsUser?.documentId
//      fsRelationship.status = UserRelationStatus.request.rawValue
//      fsRelationship.updatedAt = Timestamp(date: Date())
//      FSRelationshipWorker.add(fsRelationship: fsRelationship) {
//        switch $0.error {
//        case .none:
//          presenter()
//        case let .some(e):
//          presenterError()
//          print(e.localizedDescription)
//        }
//      }
      func updateRelationship() {
        fsRelationship.status = UserRelationStatus.accept.rawValue
        fsRelationship.updatedAt = Timestamp(date: Date())
        FSRelationshipWorker.update(fsRelationship: fsRelationship) {
          switch $0 {
          case .none:
            addRelationship()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func addRelationship() {
        let fsRelationship_add = FSRelationship()
        fsRelationship_add.userOneId = fsRelationship.userTwoId
        fsRelationship_add.userTwoId = fsRelationship.userOneId
        fsRelationship_add.status = UserRelationStatus.accept.rawValue
        fsRelationship_add.updatedAt = Timestamp(date: Date())
        FSRelationshipWorker.add(fsRelationship: fsRelationship_add) {
          switch $0.error {
          case .none:
            presenter()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      updateRelationship()
    }
    func presenter() {
      requestingRelationList.removeAll(where: { $0 == indexPath })
      adapter_notification.displayedCA.sections[indexPath.section].items.remove(at: indexPath.row)
      adapter_notification.collection.reloadData()
    }
    func presenterError(code: Int) {
      requestingRelationList.removeAll(where: { $0 == indexPath })
    }
    interactor()
  }
  
  //MARK: - VIP - DeleteRelation
  func deleteRelation(_ indexPath: IndexPath) {
    func interactor() {
      guard !requestingRelationList.contains(indexPath) else {
        return
      }
      requestingRelationList.append(indexPath)
      worker(fsRelationship: fsRelationshipList[indexPath.row])
    }
    func worker(fsRelationship: FSRelationship) {
      FSRelationshipWorker.delete(documentId: fsRelationship._documentId) {
        switch $0 {
        case .none:
          presenter()
        case let .some(e):
          presenterError()
          print(e.localizedDescription)
        }
      }
    }
    func presenter() {
      requestingRelationList.removeAll(where: { $0 == indexPath })
      adapter_notification.displayedCA.sections[indexPath.section].items.remove(at: indexPath.row)
      adapter_notification.collection.reloadData()
    }
    func presenterError() {
      requestingRelationList.removeAll(where: { $0 == indexPath })
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
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
    if let isAccept = action as? Bool {
      if isAccept {
        addRelation(indexPath)
      } else {
        deleteRelation(indexPath)
      }
    }
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}



