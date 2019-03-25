//
//  SIgnUpVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension SignUpVC
{
  
}



class SignUpVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_email: UILabel!
  @IBOutlet weak var v_emailTextField: UIView!
  @IBOutlet weak var txt_email: UITextField!
  
  @IBOutlet weak var lb_password: UILabel!
  @IBOutlet weak var v_passwordTextField: UIView!
  @IBOutlet weak var txt_password: UITextField!
  
  @IBOutlet weak var lb_confirmPassword: UILabel!
  @IBOutlet weak var v_confirmPasswordTextField: UIView!
  @IBOutlet weak var txt_confirmPassword: UITextField!
  
  @IBOutlet weak var btn_next: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
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
    nb?.setupWith(content: .black, bg: .white, isTranslucent: false)
    nb?.removeShadow()
    
    
    
    //MARK: Component
    view.setupViewFrame()
    setupFormTextField(label: lb_email, view: v_emailTextField, textField: txt_email)
    txt_email.setupEmailAddress()
    
    setupFormTextField(label: lb_password, view: v_passwordTextField, textField: txt_password)
    txt_password.setupPassword()
    
    setupFormTextField(label: lb_confirmPassword, view: v_confirmPasswordTextField, textField: txt_confirmPassword)
    txt_confirmPassword.setupPassword()
    
    btn_next.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_next.setupLight()
    btn_next.layer.cornerRadius = btn_next.frame.size.height / 2
    btn_next.clipsToBounds = true
    btn_next.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    signUpCheck()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Sign up with Email"
    lb_email.text = "Email"
    txt_email.placeholder = "Email"
    txt_email.setPlaceHolderTextColor(c_material.grey500)
    lb_password.text = "Password"
    txt_password.placeholder = "Password"
    txt_password.setPlaceHolderTextColor(c_material.grey500)
    lb_confirmPassword.text = "Confirm password"
    txt_confirmPassword.placeholder = "Confirm password"
    txt_confirmPassword.setPlaceHolderTextColor(c_material.grey500)
    btn_next.setTitleForAllStates("Next")
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
  
  private func displayEmailErrorPopup() {
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
    displayed.displayedHeader.title = "Email format"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.txt_email.becomeFirstResponder()
      default:
        break
      }
    }
  }
  
  private func displayPasswordErrorPopup() {
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
    displayed.displayedHeader.title = "Password not match"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.txt_email.becomeFirstResponder()
      default:
        break
      }
    }
  }
  
  private func displayErrorPopup() {
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
    displayed.displayedHeader.subtitle = "Exiting email"
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "try another"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.txt_email.becomeFirstResponder()
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - VIP - SignUpCheck
  func signUpCheck() {
    func interactor() {
      view.endEditing(true)
      guard let email = txt_email.text, email.isEmail else {
        presenterError(code: 0)
        return
      }
      guard let password = txt_password.text,
        let confirmPassword = txt_confirmPassword.text,
        password == confirmPassword else {
          presenterError(code: 1)
          return
      }
      let fsUser = FSUser()
      fsUser.facebookId = ""
      fsUser.email = txt_email.text
      fsUser.password = txt_password.text
      worker(fsUser: fsUser)
    }
    func worker(fsUser: FSUser) {
      FSUserWorker.fetchWhere(email: fsUser._email) {
        switch $0.error {
        case .none:
          guard $0.data.isEmpty else {
            presenterError(code: 2)
            return
          }
          presenter(fsUser: fsUser)
        case let .some(e):
          presenterError(code: 2)
          print(e.localizedDescription)
        }
      }
    }
    func presenter(fsUser: FSUser) {
      let vc = ProfileFormVC.vc()
      vc.fsUser = fsUser
      nc?.pushViewController(vc, animated: true)
    }
    func presenterError(code: Int) {
      switch code {
      case 0:
        displayEmailErrorPopup()
      case 1:
        displayPasswordErrorPopup()
      case 2:
        displayErrorPopup()
      default:
        break
      }
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

