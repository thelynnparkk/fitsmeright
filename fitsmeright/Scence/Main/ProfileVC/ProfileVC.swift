//
//  ProfileVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ProfileVC:
  AGVCInstantiatable,
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
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsUser: FSUser?
  var posts: [MockPost] = []
  
  
  
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
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    view.backgroundColor = c_material.grey300
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    //    view.setupViewFrame()
    collection_main = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_profile = ProfileCA(collection: collection_main)
    adapter_profile.delegate = self
    view.addSubview(collection_main)
    v_addFriendFloating.delegate = self
    let vm_plus = FloatingViewUC.ViewModel()
    vm_plus.displayedFloating.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addFriendFloating.setupData(with: vm_plus)
    view.bringSubviewToFront(v_addFriendFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_main.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchProfile()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ProfileVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchProfile
  func fetchProfile() {
    
    func interactor() {
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
      let vm = ProfileCAUC.ViewModel()
      vm.displayedProfile.image = nil
      vm.displayedProfile.displayName = fsUser!._displayName
      vm.displayedProfile.bio = fsUser!._bio
      vm.displayedProfile.posts = "\(posts.count)"
      vm.displayedProfile.friends = "0"
      vm.displayedProfile.closets = "0"
      vm.displayedItems = posts.compactMap({
        let vm = ImageCCUC.ViewModel()
        vm.displayedImage.imageUrl = URL(string: $0._displayName)
        return vm
      })
      
      DispatchQueue.main.async { [weak self] in
        guard let _s = self else { return }
        _s.adapter_profile.setupData(with: vm)
      }
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
//    let vc = ClosetFormVC.vc
//    vc.closetCategory = closetCategory
//    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
//    let vc = ClosetVC.vc
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
