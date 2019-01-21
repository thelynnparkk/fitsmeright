//
//  TemplateVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension TemplateVC
{
  
}



class TemplateVC: UIViewController {
  
  //MARK: - AGInstantiatable
  static var sb_name: String = "TemplateTVC"
  static var vc_name: String = "TemplateTVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    //MARK: Core
    
    
    
    //MARK: UI
    
    
    
    //MARK: Misc
    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

