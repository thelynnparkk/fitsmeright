//
//  ClosetVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ClosetVC:
  AGVCInstantiatable,
  ClosetMenuViewDelegate
{
  
}



class ClosetVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "ClosetVC"
  static var vc_name: String = "ClosetVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var imgv_background: UIImageView!
  
  @IBOutlet weak var v_dress: ClosetMenuView!
  @IBOutlet weak var v_jacket: ClosetMenuView!
  @IBOutlet weak var v_hat: ClosetMenuView!
  @IBOutlet weak var v_accessories: ClosetMenuView!
  @IBOutlet weak var v_bag: ClosetMenuView!
  @IBOutlet weak var v_shoe: ClosetMenuView!
  @IBOutlet weak var v_top: ClosetMenuView!
  @IBOutlet weak var v_bottom: ClosetMenuView!
  @IBOutlet weak var v_sock: ClosetMenuView!
  
  
  
  
  
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
//    let c = UIColor.Custom.self
//    let nb = navigationController?.navigationBar
//    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    navigationItem.title = ClosetVC.sb_name
    lb_title.text = ClosetVC.sb_name
    
    
    //MARK: UI
    v_dress.delegate = self
    v_jacket.delegate = self
    v_hat.delegate = self
    v_accessories.delegate = self
    v_bag.delegate = self
    v_shoe.delegate = self
    v_top.delegate = self
    v_bottom.delegate = self
    v_sock.delegate = self
    
    
    
    //MARK: Misc
    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    fetchClosetMenus()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchClosetMenus
  func fetchClosetMenus() {
    v_dress.setup(title: "0 Dresss", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_jacket.setup(title: "0 Jackets", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_hat.setup(title: "0 Hats", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_accessories.setup(title: "0 Accessories", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_bag.setup(title: "0 Bags", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_shoe.setup(title: "0 Shoes", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_top.setup(title: "0 Tops", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_bottom.setup(title: "0 Bottoms", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
    v_sock.setup(title: "0 Socks", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ClosetMenuViewDelegate
  func closetMenuViewPressed(_ view: UIView) {
    print((view as! ClosetMenuView).lb_title.text!)
    switch view {
    case v_dress:
      break
    case v_jacket:
      break
    case v_hat:
      break
    case v_accessories:
      break
    case v_bag:
      break
    case v_shoe:
      break
    case v_top:
      break
    case v_bottom:
      break
    case v_sock:
      break
    default:
      return
    }
    let vc = ClosetDetailVC.vc
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
