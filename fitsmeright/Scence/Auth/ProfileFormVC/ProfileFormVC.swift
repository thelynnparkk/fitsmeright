//
//  ProfileFormVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import FirebaseStorage
import FirebaseFirestore



extension ProfileFormVC:
  AGViewDelegate
{
  
}



class ProfileFormVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var v_state: StateView!
  
  @IBOutlet weak var btn_user: UIButton!
  @IBOutlet weak var imgv_chooseUser: UIImageView!
  
  @IBOutlet weak var v_chooseUserImageView: UIView!
  @IBOutlet weak var imgv_userPlaceHolder: UIImageView!
  @IBOutlet weak var imgv_user: UIImageView!
  
  @IBOutlet weak var lb_username: UILabel!
  @IBOutlet weak var v_usernameTextField: UIView!
  @IBOutlet weak var txt_username: UITextField!
  
  @IBOutlet weak var lb_displayName: UILabel!
  @IBOutlet weak var v_displayNameTextField: UIView!
  @IBOutlet weak var txt_displayName: UITextField!
  
  @IBOutlet weak var lb_bio: UILabel!
  @IBOutlet weak var v_bioTextField: UIView!
  @IBOutlet weak var txt_bio: UITextField!
  
  @IBOutlet weak var btn_done: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var isChoosenUserImage = false
  
  
  
  //MARK: - Storage
  var fsUser: FSUser?
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    if let documentId = fsUser?.documentId, !documentId.isEmpty {
      return .lightContent
    } else {
      return .default
    }
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
    
    
    
    //MARK: Component
    view.setupViewFrame()
    
    btn_user.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    imgv_user.contentMode = .scaleAspectFit
    imgv_user.layer.borderColor = c_material.grey300.cgColor
    imgv_user.layer.borderWidth = 2
    imgv_user.layer.cornerRadius = 50
    imgv_user.clipsToBounds = true
    imgv_user.kf.indicatorType = .activity
    
    imgv_userPlaceHolder.clipsToBounds = true
    imgv_userPlaceHolder.image = #imageLiteral(resourceName: "ic_placeholder_profile").filled(withColor: c_material.grey300)
    
    imgv_chooseUser.contentMode = .scaleAspectFit
//    imgv_chooseUser.layer.cornerRadius = 50
    imgv_chooseUser.clipsToBounds = true
    imgv_chooseUser.image = #imageLiteral(resourceName: "ic_camera")
    
    v_chooseUserImageView.backgroundColor = c_custom.peach
    v_chooseUserImageView.layer.cornerRadius = v_chooseUserImageView.frame.width / 2
    v_chooseUserImageView.clipsToBounds = true
    
    setupFormTextField(label: lb_username, view: v_usernameTextField, textField: txt_username)
    txt_username.setupUsername()
    
    setupFormTextField(label: lb_displayName, view: v_displayNameTextField, textField: txt_displayName)
    txt_displayName.setupName()
    
    setupFormTextField(label: lb_bio, view: v_bioTextField, textField: txt_bio)
    
    btn_done.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_done.setupLight()
    btn_done.layer.cornerRadius = btn_done.frame.size.height / 2
    btn_done.clipsToBounds = true
    btn_done.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    view.addSubview(v_state)
    
    
    
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
    if let fsUser = fsUser, let _ = fsUser.documentId {
      fetchUserEdit()
    } else {
      fetchUserAdd()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    switch sender {
    case btn_user:
      displayImagePickerPopup() 
    case btn_done:
      if let fsUser = fsUser, let _ = fsUser.documentId {
        updateUser()
      } else {
        addUser()
      }
    default:
      break
    }
    
    
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    if let fsUser = fsUser, let _ = fsUser.documentId {
      ni.title = "Edit Profile"
    } else {
      ni.title = "Set up your profile"
    }
    lb_username.text = "Username"
    txt_username.placeholder = "Username"
    txt_username.setPlaceHolderTextColor(c_material.grey500)
    lb_displayName.text = "Display Name"
    txt_displayName.placeholder = "Display Name"
    txt_displayName.setPlaceHolderTextColor(c_material.grey500)
    lb_bio.text = "Bio (Optional)"
    txt_bio.placeholder = "Bio"
    txt_bio.setPlaceHolderTextColor(c_material.grey500)
    btn_done.setTitleForAllStates("Done")
  }
  
  
  
  //MARK: - Private
  private func setupFormTextField(label: UILabel, view: UIView, textField: UITextField) {
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    
    view.layer.borderColor = c_material.grey500.cgColor
    view.layer.borderWidth = 1
    view.layer.cornerRadius = view.frame.size.height / 2
    view.backgroundColor = .white
    
    textField.textColor = c_custom.peach
  }
  
  private func displayUserNameErrorPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_ok = LabelCCDisplayed()
      displayed_ok.title = "OK"
      displayed_ok.weight = .semibold
      displayed_ok.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_ok]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_no").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Wrong input"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Display name format"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.txt_username.becomeFirstResponder()
      default:
        break
      }
    }
  }
  
  private func displayDisplayNameErrorPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_ok = LabelCCDisplayed()
      displayed_ok.title = "OK"
      displayed_ok.weight = .semibold
      displayed_ok.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_ok]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_no").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Wrong input"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Username format"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.txt_displayName.becomeFirstResponder()
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - VIP - FetchUserAdd
  func fetchUserAdd() {
    func interactor() {
      guard let fsUser = fsUser else {
        presenterError()
        return
      }
      presenter(fsUser: fsUser)
    }
    func presenter(fsUser: FSUser) {
      if let image = fsUser.getValidImageURL {
        imgv_userPlaceHolder.isHidden = true
        imgv_user.kf.setImage(with: image)
      }
      txt_username.text = fsUser.username
      txt_displayName.text = fsUser.displayName
      txt_bio.text = fsUser.bio
    }
    func presenterError() {
      
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchUserEdit
  func fetchUserEdit() {
    func interactor() {
      guard let fsUser = fsUser else {
        presenterError()
        return
      }
      presenter(fsUser: fsUser)
    }
    func presenter(fsUser: FSUser) {
      if let image = fsUser.getValidImageURL {
        imgv_userPlaceHolder.isHidden = true
        imgv_user.kf.setImage(with: image)
      }
      txt_username.text = fsUser.username
      txt_displayName.text = fsUser.displayName
      txt_bio.text = fsUser.bio
    }
    func presenterError() {
      
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - AddUser
  func addUser() {
    func interactor() {
      view.endEditing(true)
      btn_done.isUserInteractionEnabled = false
      v_state.setState(with: .loading, isAnimation: false)
      guard let fsUser = fsUser else {
        presenterError(code: 0)
        return
      }
      guard let username = txt_username.text else {
        presenterError(code: 1)
        return
      }
      guard let displayName = txt_displayName.text else {
        presenterError(code: 2)
        return
      }
      fsUser.username = username
      fsUser.displayName = displayName
      fsUser.bio = txt_bio.text
      fsUser.updatedAt = Timestamp(date: Date())
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      func uploadUserImage() {
        FSWorker.uploadImage(folder: SUser.folder, image: imgv_user.image) {
          switch $0.error {
          case .none:
            fsUser.image = $0.url?.absoluteString
            addUser()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func addUser() {
        FSUserWorker.add(fsUser: fsUser) {
          switch $0.error {
          case .none:
            fsUser.documentId = $0.ref?.documentID
            UserDefaults.FSUserDefault.set(data: fsUser)
            UserDefaults.LoggedIn.set(data: true)
            presenter()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      if isChoosenUserImage {
        uploadUserImage()
      } else {
        addUser()
      }
    }
    func presenter() {
      let vc = MainTBC.vc()
      let nvc = UINavigationController(rootViewController: vc)
      window?.set(with: nvc, style: .fade)
    }
    func presenterError(code: Int) {
      switch code {
      case 0:
        v_state.setState(with: .error, isAnimation: false)
        btn_done.isEnabled = true
      case 1:
        displayDisplayNameErrorPopup()
      case 2:
        displayDisplayNameErrorPopup()
      default:
        break
      }
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - UpdateUser
  func updateUser() {
    func interactor() {
      view.endEditing(true)
      btn_done.isUserInteractionEnabled = false
      v_state.setState(with: .loading, isAnimation: false)
      guard let fsUser = fsUser else {
        presenterError(code: 0)
        return
      }
      guard let username = txt_username.text else {
        presenterError(code: 1)
        return
      }
      guard let displayName = txt_displayName.text else {
        presenterError(code: 2)
        return
      }
      fsUser.username = username
      fsUser.displayName = displayName
      fsUser.bio = txt_bio.text
      fsUser.updatedAt = Timestamp(date: Date())
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      func uploadUserImage() {
        FSWorker.uploadImage(folder: SUser.folder, image: imgv_user.image) {
          switch $0.error {
          case .none:
            FSWorker.deleteImage(url: fsUser._image)
            fsUser.image = $0.url?.absoluteString
            updateUser()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func updateUser() {
        FSUserWorker.update(fsUser: fsUser) {
          switch $0 {
          case .none:
            UserDefaults.FSUserDefault.set(data: fsUser)
            presenter()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      if isChoosenUserImage {
        uploadUserImage()
      } else {
        updateUser()
      }
    }
    func presenter() {
      nvc?.popViewController(animated: true)
    }
    func presenterError(code: Int) {
      switch code {
      case 0:
        v_state.setState(with: .error, isAnimation: false)
        btn_done.isEnabled = true
      case 1:
        displayDisplayNameErrorPopup()
      case 2:
        displayDisplayNameErrorPopup()
      default:
        break
      }
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true) { [weak self] in
      guard let _s = self else { return }
      _s.isChoosenUserImage = true
      _s.imgv_user.image = image
      _s.imgv_userPlaceHolder.isHidden = true
    }
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
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
          v_state.setState(with: .hidden)
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}


