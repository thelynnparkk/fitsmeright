//
//  BlankVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension BlankVC:
  AGVCInstantiatable
{
  
}



class BlankVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "BlankVC"
  static var vc_name: String = "BlankVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var btn_push: UIButton!
  
  
  
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
    let nb = navigationController?.navigationBar
    nb?.setupLargeTitlesWith(content: .white, bg: .orange)
    let ni = navigationItem
    ni.title = BlankVC.sb_name
//    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
//    ni.leftBarButtonItems = [bbi_cancel]
    
    let img_cancel = #imageLiteral(resourceName: "ic_control")
    let size = CGSize(width: 22, height: 44)
    let btn_cancel_1 = UIButton(type: .custom)
    btn_cancel_1.setImage(img_cancel, for: .normal)
    btn_cancel_1.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
    let btn_cancel_2 = UIButton(type: .custom)
    btn_cancel_2.setImage(img_cancel, for: .normal)
    btn_cancel_2.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
    let btn_cancel_3 = UIButton(type: .custom)
    btn_cancel_3.setImage(img_cancel, for: .normal)
    btn_cancel_3.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
    
    let bbi_cancel_1 = UIBarButtonItem(view: btn_cancel_1, size: size, offset: 0)
    let bbi_cancel_2 = UIBarButtonItem(view: btn_cancel_2, size: size, offset: 8)
    let bbi_cancel_3 = UIBarButtonItem(view: btn_cancel_3, size: size, offset: 8)
    
    ni.leftBarButtonItems = [bbi_cancel_1, bbi_cancel_2, bbi_cancel_3]
    
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(backButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    lb_title.text = BlankVC.sb_name
    btn_push.addTarget(self, action: #selector(pushButtonPressed), for: .touchUpInside)
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  @objc
  func pushButtonPressed(_ sender: UIButton) {
    let vc = BlankVC.vc
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}