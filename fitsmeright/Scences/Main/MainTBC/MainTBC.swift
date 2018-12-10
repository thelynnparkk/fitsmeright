//
//  MainTBC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import RAMAnimatedTabBarController



extension MainTBC:
  UIBarPositioningDelegate,
  AGVCInstantiatable
{
  
}



class MainTBC: RAMAnimatedTabBarController {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "MainTBC"
  static var vc_name: String = "MainTBC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var vc_01: FeedVC!
  var vc_02: CreatePostVC!
  var vc_03: ProfileVC!
  
  
  
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
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
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
    vc_01 = FeedVC.vc
    vc_02 = CreatePostVC.vc
    vc_03 = ProfileVC.vc
    
    let nvc_01 = UINavigationController(rootViewController: vc_01)
    let nvc_02 = UINavigationController(rootViewController: vc_02)
    let nvc_03 = UINavigationController(rootViewController: vc_03)
    
    let tbi_01 = RAMAnimatedTabBarItem(title: FeedVC.vc_name, image: nil, selectedImage: nil)
    let tbi_02 = RAMAnimatedTabBarItem(title: CreatePostVC.vc_name, image: nil, selectedImage: nil)
    let tbi_03 = RAMAnimatedTabBarItem(title: ProfileVC.vc_name, image: nil, selectedImage: nil)
    
    setupRAMAnimatedTabBarItem(for: tbi_01)
    setupRAMAnimatedTabBarItem(for: tbi_02)
    setupRAMAnimatedTabBarItem(for: tbi_03)
    
    nvc_01.tabBarItem = tbi_01
    nvc_02.tabBarItem = tbi_02
    nvc_03.tabBarItem = tbi_03
    
    viewControllers = [nvc_01, nvc_02, nvc_03]
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  private func setupRAMAnimatedTabBarItem(for item: RAMAnimatedTabBarItem) {
    item.textColor = .black
    item.iconColor = .black
    let animation = RAMBounceAnimation()
    animation.iconSelectedColor = .black
    animation.textSelectedColor = .black
    animation.duration = 0.8
    item.animation = animation
  }
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
