//
//  SplashVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension SplashVC:
  AGVCInstantiatable
{
  
}



class SplashVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  
  
  
  //MARK: - Initial

  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
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
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchLoginData()
  }
  
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
    let vc = MainTBC.vc
    let nvc = UINavigationController(rootViewController: vc)
    window?.set(with: nvc, style: .fade)
  }
  
  func routeToLogin() {
    let vc = MainTBC.vc
    let nvc = UINavigationController(rootViewController: vc)
    window?.set(with: nvc, style: .fade)
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
