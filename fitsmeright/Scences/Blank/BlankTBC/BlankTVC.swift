//
//  BlankTVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension BlankTVC:
  AGVCInstantiatable,
  UITableViewDataSource,
  UITableViewDelegate
{
  
  
}



class BlankTVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "BlankTVC"
  static var vc_name: String = "BlankTVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var table_main: UITableView!
  
  
  
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
    ni.title = BlankTVC.sb_name
//    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
//    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    table_main.dataSource = self
    table_main.delegate = self
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  @objc
  func nextButtonPressed(_ sender: UIButton) {
    let vc = BlankVC.vc
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  
  //MARK: - Core - UITableViewDelegate
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
