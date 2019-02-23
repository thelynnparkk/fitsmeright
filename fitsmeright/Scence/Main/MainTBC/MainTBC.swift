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
  UITabBarControllerDelegate
{
  
}



//TBC TabbarController
class MainTBC: RAMAnimatedTabBarController {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var vc_01: PostListVC!
  var vc_02: ClosetCategoryVC!
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
    return .lightContent
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
    delegate = self
    nc?.isNavigationBarHidden = true
    
//    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    let tb = tabBar
    tb.setupWith(content: .white, bg: .white, isTranslucent: false)
    
    
    
    //MARK: UI
    vc_01 = PostListVC.vc()
    vc_02 = ClosetCategoryVC.vc()
    vc_03 = ProfileVC.vc()
    
    let nvc_01 = UINavigationController(rootViewController: vc_01)
    let nvc_02 = UINavigationController(rootViewController: vc_02)
    let nvc_03 = UINavigationController(rootViewController: vc_03)
    
    let tbi_01 = RAMAnimatedTabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_tabbar_home"), selectedImage: nil)
    let tbi_02 = RAMAnimatedTabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_tabbar_closet"), selectedImage: nil)
    let tbi_03 = RAMAnimatedTabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_tabbar_profile"), selectedImage: nil)
    
    let animation = RAMNonAnimation()
    //    animation.duration = 0.0
    tbi_01.setupWith(color: c_material.grey300, selectedColor: c_custom.peach, itemAnimation: animation)
    tbi_02.setupWith(color: c_material.grey300, selectedColor: c_custom.peach, itemAnimation: animation)
    tbi_03.setupWith(color: c_material.grey300, selectedColor: c_custom.peach, itemAnimation: animation)
    
    vc_01.tabBarItem = tbi_01
    vc_02.tabBarItem = tbi_02
    vc_03.tabBarItem = tbi_03
    
    //    viewControllers = [vc_01, vc_02, vc_03]
    
    nvc_01.tabBarItem = tbi_01
    nvc_02.tabBarItem = tbi_02
    nvc_03.tabBarItem = tbi_03
    viewControllers = [nvc_01, nvc_02, nvc_03]
    
    
    
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
  
  
  
  //MARK: - Core - UITabBarControllerDelegate
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
//    var shouldSelect: Bool = true
//    switch viewController {
//    case let vc where vc is BlankVC:
//      let vc = PostCreateClosetVC.vc()
//      let nvc = UINavigationController(rootViewController: vc)
//      present(nvc, animated: true, completion: nil)
//      shouldSelect = false
//    default:
//      break
//    }
//    return shouldSelect
  }
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
