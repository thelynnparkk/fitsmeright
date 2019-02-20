//
//  SplashVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension SplashVC
{
  
}



class SplashVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  
  
  
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
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    view.backgroundColor = c_custom.peach
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchLoginData()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  func fetchLoginData() {
    if let loggedIn = FMUserDefaults.LoggedIn.get(), loggedIn {
      routeToMain()
    } else {
      routeToLogin()
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  func routeToMain() {
    let vc = MainTBC.vc()
    let nvc = UINavigationController(rootViewController: vc)
    window?.set(with: nvc, style: .fade)
  }
  
  func routeToLogin() {
    let vc = MainTBC.vc()
    let nvc = UINavigationController(rootViewController: vc)
    window?.set(with: nvc, style: .fade)
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
