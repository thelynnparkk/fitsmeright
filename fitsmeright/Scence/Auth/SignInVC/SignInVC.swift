//
//  SignInVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



import FacebookCore
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit



extension SignInVC
{
  
}



class SignInVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var imgv_logo: UIImageView!
  var tapGesture: UITapGestureRecognizer!
  @IBOutlet weak var v_usernameTextField: UIView!
  @IBOutlet weak var txt_username: UITextField!
  @IBOutlet weak var v_passwordTextField: UIView!
  @IBOutlet weak var txt_password: UITextField!
  @IBOutlet weak var btn_signIn: UIButton!
  @IBOutlet weak var btn_facebook: UIButton!
  @IBOutlet weak var btn_signUp: UIButton!
  @IBOutlet weak var btn_forgot: UIButton!
  
  
  
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
    
    imgv_logo.contentMode = .scaleAspectFit
    imgv_logo.image = #imageLiteral(resourceName: "ic_applogo")
    
    setupFormTextField(view: v_usernameTextField, textField: txt_username)
    setupFormTextField(view: v_passwordTextField, textField: txt_password)
    
    txt_username.setupEmailAddress()
    txt_password.setupPassword()
    
    btn_signIn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_signIn.setupLight()
    btn_signIn.layer.cornerRadius = btn_signIn.frame.size.height / 2
    btn_signIn.clipsToBounds = true
    btn_signIn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    btn_facebook.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_facebook.setupFacebookLight()
    btn_facebook.layer.cornerRadius = btn_facebook.frame.size.height / 2
    btn_facebook.clipsToBounds = true
    btn_facebook.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    btn_signUp.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_signUp.setupBorderMonoLight()
    btn_signUp.layer.cornerRadius = btn_signUp.frame.size.height / 2
    btn_signUp.clipsToBounds = true
    btn_signUp.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    btn_forgot.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_forgot.setupTextLight()
    btn_forgot.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
    imgv_logo.addGestureRecognizer(tapGesture)
    imgv_logo.isUserInteractionEnabled = true
    

    
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
    switch sender {
    case btn_signIn:
      fetchSignIn()
    case btn_facebook:
      fetchFacebook()
    case btn_signUp:
      let vc = SignUpVC.vc()
      nc?.pushViewController(vc, animated: true)
    case btn_forgot:
      let vc = ForgotVC.vc()
      nc?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
  
  @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
    txt_username.text = AGSwift.getMockUser().email
    txt_password.text = AGSwift.getMockUser().password
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    txt_username.placeholder = "Username or Email"
    txt_username.setPlaceHolderTextColor(c_material.grey500)
    txt_password.placeholder = "Password"
    txt_password.setPlaceHolderTextColor(c_material.grey500)
    btn_signIn.setTitleForAllStates("Sign in")
    btn_facebook.setTitleForAllStates("Sign in with Facebook")
    btn_signUp.setTitleForAllStates("Sign up with Email")
    btn_forgot.setTitleForAllStates("Forgot password?")
  }
  
  
  
  //MARK: - Private
  private func setupFormTextField(view: UIView, textField: UITextField) {
    view.layer.borderColor = c_custom.peach.cgColor
    view.layer.borderWidth = 1
    view.layer.cornerRadius = view.frame.size.height / 2
    view.backgroundColor = .white
    textField.textColor = c_custom.peach
  }
  
  private func displayFacebookErrorPopup() {
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
    displayed.displayedHeader.subtitle = "Please try again."
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Facebook login error"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        break
      default:
        break
      }
    }
  }
  
  
  //MARK: - VIP - FetchSignIn
  func fetchSignIn() {
    func interactor() {
      guard let email = txt_username.text, let password = txt_password.text else {
        presenterError(code: 0)
        return
      }
      worker(email: email, password: password)
    }
    func worker(email: String, password: String) {
      FSUserWorker.get(email: email, password: password) {
        switch $0.error {
        case .none:
          UserDefaults.FSUserDefault.set(data: $0.data)
          UserDefaults.LoggedIn.set(data: true)
          presenter()
        case let .some(e):
          presenterError(code: 1)
          print(e.localizedDescription)
        }
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
        break
      case 1:
        break
      default:
        break
      }
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchFacebook
  func fetchFacebook() {
    func interactor() {
      worker()
    }
    func worker() {
      func facebookLogin() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) {
          switch $0 {
          case let .failed(e):
            print(e.localizedDescription)
            presenterError()
          case .cancelled:
            presenterError()
          case .success(grantedPermissions: _, declinedPermissions: _, token: _):
            facebookGraph()
          }
        }
      }
      func facebookGraph() {
        let params = [
          "fields": "email, name, picture.type(large)"
        ]
        let graphRequest = GraphRequest(graphPath: "me", parameters: params)
        graphRequest.start() { (urlResponse, requestResult) in
          switch requestResult {
          case let .success(data):
            guard let dictionaryValue = data.dictionaryValue else {
              presenterError()
              return
            }
            presenter(dictionaryValue: dictionaryValue)
          case let .failed(e):
            print(e.localizedDescription)
            presenterError()
          }
        }
      }
      facebookLogin()
    }
    func presenter(dictionaryValue: [String: Any]) {
      print(dictionaryValue)
    }
    func presenterError() {
      FBSDKProfile.setCurrent(nil)
      FBSDKAccessToken.setCurrent(nil)
      displayFacebookErrorPopup()
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

