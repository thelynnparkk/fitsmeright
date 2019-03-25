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
  var bbi_setting: UIBarButtonItem!
  var collection_profile: UICollectionView!
  var adapter_profile: ProfileCA!
  var v_state: StateView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var isFetctProfileFristTime = true
  
  
  
  //MARK: - Storage
  var postList: [Post] = []
  var section_profile: ProfileCADisplayed.Section?
  var section_post: ProfileCADisplayed.Section?
  
  
  
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
    
    bbi_setting = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_more"), style: .plain, target: self, action: #selector(settingBarButtonPressed))
    ni.rightBarButtonItems = [bbi_setting]
    
    
    
    //MARK: Component
    //    view.setupViewFrame()
    collection_profile = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_profile = ProfileCA(collection: collection_profile)
    adapter_profile.delegate = self
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(collection_profile)
    view.addSubview(v_state)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_profile.snp.makeConstraints {
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
    fetchPostList()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @IBAction func settingBarButtonPressed(_ sender: Any) {
    displaySettingPopup()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Profile"
  }
  
  
  
  //MARK: - Private
  private func displaySettingPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_editProfile = LabelCCDisplayed()
      displayed_editProfile.title = "Edit Profile"
      displayed_editProfile.style = .normal
      let displayed_logOut = LabelCCDisplayed()
      displayed_logOut.title = "Log Out"
      displayed_logOut.weight = .semibold
      displayed_logOut.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_editProfile, displayed_logOut]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_choose").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Message"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Setting"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        print("Edit")
      case 1:
        _s.displayLogoutPopup()
      default:
        break
      }
    }
  }
  
  private func displayLogoutPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_logOut = LabelCCDisplayed()
      displayed_logOut.title = "Log Out"
      displayed_logOut.style = .normal
      let displayed_cancelLabel = LabelCCDisplayed()
      displayed_cancelLabel.title = "Cancel"
      displayed_cancelLabel.weight = .semibold
      displayed_cancelLabel.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_logOut, displayed_cancelLabel]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_logout").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Log out"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Setting"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        UserDefaults.removeAll()
        let vc = SignInVC.vc()
        let nvc = UINavigationController(rootViewController: vc)
        _s.window?.set(with: nvc, style: .fade)
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - VIP - FetchProfile
  func fetchProfile() {
    func interactor() {
      if isFetctProfileFristTime {
        isFetctProfileFristTime  = false
        v_state.setState(with: .loading, isAnimation: false)
      }
      let fsUser = UserDefaults.FSUserDefault.get()!
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      present(fsUser: fsUser)
    }
    func present(fsUser: FSUser) {
      v_state.setState(with: .hidden)
      if let _ = section_profile {
        
      } else {
        section_profile = ProfileCADisplayed.Section()
        let cc_displayed = ProfileCCDisplayed()
        section_profile?.items = [cc_displayed]
      }
      if let cc_displayed = section_profile?.items.first as? ProfileCCDisplayed {
        cc_displayed.imageURL = fsUser.imageURL
        cc_displayed.displayName = fsUser._displayName
        cc_displayed.bio = fsUser._bio
        cc_displayed.posts = "\(postList.count)"
        cc_displayed.friends = "0"
        cc_displayed.closets = "0"
      }
      let displayed = ProfileCADisplayed()
      displayed.sections = [section_profile, section_post].compactMap({ $0 })
      adapter_profile.setupData(with: displayed)
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchPostList
  func fetchPostList() {
    var postList: [Post] = []
    var fsPostList: [FSPost] = []
    func interactor() {
      let fsUser = UserDefaults.FSUserDefault.get()!
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      FSPostWorker.fetchWhere(userId: fsUser._documentId) { [weak self] in
        guard let _ = self else { return }
        switch $0.error {
        case .none:
          fsPostList += $0.data
          present(fsUser: fsUser)
        case let .some(e):
          print(e.localizedDescription)
          presentError()
        }
      }
    }
    func present(fsUser: FSUser) {
      for p in fsPostList {
        let post = Post()
        post.fsPost = p
        post.fsUser = fsUser
        postList.append(post)
      }
      self.postList = postList
      if let cc_displayed = section_profile?.items.first as? ProfileCCDisplayed {
        cc_displayed.posts = "\(postList.count)"
      }
      if let _ = section_post {
        
      } else {
        section_post = ProfileCADisplayed.Section()
      }
      section_post?.items = postList.compactMap({
        let displayed = ImageCCDisplayed()
        displayed.imageURL = $0._fsPost.imageURL
        return displayed
      })
      let displayed = ProfileCADisplayed()
      displayed.sections = [section_profile, section_post].compactMap({ $0 })
      adapter_profile.setupData(with: displayed)
    }
    func presentError() {
      
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {

  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    print(indexPath)
    let vc = PostVC.vc()
    vc.postSelected = postList[indexPath.row]
    nc?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
