//
//  ProfileVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ProfileVC:
  AGViewDelegate,
  AGCADelegate,
  AGVCDelegate
{
  
}



class ProfileVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_addFriendFloating: FloatingView!
  var collection_main: UICollectionView!
  var adapter_profile: ProfileCA!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var isFetctProfileFristTime = true
  
  
  
  //MARK: - Storage
  var fsUser: FSUser?
  var posts: [MockPost] = []
  
  
  
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
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = c_material.grey300
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    //    view.setupViewFrame()
    collection_main = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_profile = ProfileCA(collection: collection_main)
    adapter_profile.delegate = self
    
    v_addFriendFloating.delegate = self
    let vm_plus = FloatingViewDisplayed()
    vm_plus.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addFriendFloating.setupData(with: vm_plus)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_main)
    view.addSubview(v_state)
    view.bringSubviewToFront(v_addFriendFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_main.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
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
    fetchProfile()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Profile"
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchProfile
  func fetchProfile() {
    func interactor() {
      if isFetctProfileFristTime {
        isFetctProfileFristTime  = false
        v_state.setState(with: .loading, isAnimation: false)
      }
      worker()
    }
    func worker() {
      fsUser = FMUserDefaults.FSUserDefault.get()!
      if let p = FMUserDefaults.Post.get() {
        posts = [p]
      }
      present()
    }
    func present() {
      v_state.setState(with: .hidden)
      let section_profile = ProfileCADisplayed.Section()
      let cc_displayed = ProfileCCDisplayed()
      cc_displayed.imageURL = nil
      cc_displayed.displayName = fsUser!._displayName
      cc_displayed.bio = fsUser!._bio
      cc_displayed.posts = "\(posts.count)"
      cc_displayed.friends = "0"
      cc_displayed.closets = "0"
      section_profile.items = [cc_displayed]
      
      let section_post = ProfileCADisplayed.Section()
      section_post.items = posts.compactMap({
        let displayed = ImageCCDisplayed()
        displayed.imageURL = URL(string: $0._displayName)
        return displayed
      })
      
      let displayed = ProfileCADisplayed()
      displayed.sections = [section_profile, section_post]
      adapter_profile.setupData(with: displayed)
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
//    let vc = ClosetFormVC.vc()
//    vc.closetCategory = closetCategory
//    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
//    let vc = ClosetVC.vc()
//    vc.fsCloset = fsClosets[indexPath.row]
//    vc.closetCategory = closetCategory
//    vc.delegate_agvc = self
//    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
//    func closet(action: ClosetVC.Action) {
//      switch action {
//      case let .update(fsCloset):
//        if let index = fsClosets.firstIndex(where: { $0._documentId == fsCloset._documentId }) {
//          fsClosets[index] = fsCloset
//          fetchClosets()
//        }
//      }
//    }
//
//    if let action = action as? ClosetVC.Action {
//      closet(action: action)
//    }
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
