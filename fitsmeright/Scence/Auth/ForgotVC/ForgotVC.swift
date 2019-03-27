//
//  ForgotVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension ForgotVC
{
  
}



class ForgotVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_email: UILabel!
  @IBOutlet weak var v_emailTextField: UIView!
  @IBOutlet weak var txt_email: UITextField!
  
  @IBOutlet weak var btn_done: UIButton!
  
  
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
    
    
    
    //MARK: Component
    view.setupViewFrame()
    setupFormTextField(label: lb_email, view: v_emailTextField, textField: txt_email)
    txt_email.setupEmailAddress()
    
    btn_done.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_done.setupLight()
    btn_done.layer.cornerRadius = btn_done.frame.size.height / 2
    btn_done.clipsToBounds = true
    btn_done.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    
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
    resetPassword()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Forgot Password"
    lb_email.text = "Email"
    txt_email.placeholder = "Email"
    txt_email.setPlaceHolderTextColor(c_material.grey500)

    btn_done.setTitleForAllStates("Reset Password")
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
    displayed.displayedHeader.subtitle = "Please type your email again."
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Wrong format"
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
  
  private func displayResetPasswordSuccessPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_ok = LabelCCDisplayed()
      displayed_ok.title = "OK"
      displayed_ok.weight = .semibold
      displayed_ok.style = .positive
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
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_yes").filled(withColor: c_material.green500)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Please check your email inbox."
    displayed.displayedHeader.tint = c_material.green500
    displayed.displayedHeader.title = "Reset Password Success"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.nc?.popViewController(animated: true)
      default:
        break
      }
    }
  }
  
  private func displayResetPasswordErrorPopup() {
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
    displayed.displayedHeader.subtitle = "Please type your email again."
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Email not found"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _ = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        break
      default:
        break
      }
    }
  }
  
  
  //MARK: - VIP - ResetPassword
  func resetPassword() {
    func interactor() {
      view.endEditing(true)
      btn_done.isEnabled = false
      guard let email = txt_email.text, email.isEmail else {
        presenterError(code: 0)
        return
      }
      worker()
    }
    func worker() {
      FSUserWorker.fetchWhere(email: txt_email.text ?? "") {
        switch $0.error {
        case .none:
          guard !$0.data.isEmpty else {
            presenterError(code: 1)
            return
          }
          presenter()
        case let .some(e):
          presenterError(code: 1)
          print(e.localizedDescription)
        }
      }
    }
    func presenter() {
      displayResetPasswordSuccessPopup()
    }
    func presenterError(code: Int) {
      btn_done.isEnabled = true
      switch code {
      case 0:
        displayEmailErrorPopup()
      case 1:
        displayResetPasswordErrorPopup()
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

