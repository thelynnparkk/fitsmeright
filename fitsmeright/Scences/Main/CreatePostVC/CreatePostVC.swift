//
//  CreatePostVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreatePostVC:
  AGVCInstantiatable,
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate
{
  
}



class CreatePostVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "CreatePostVC"
  static var vc_name: String = "CreatePostVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var txt_name: UITextField!
  @IBOutlet weak var btn_addCloth: UIButton!
  
  @IBOutlet weak var imgv_top: UIImageView!
  
  
  
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
    return true
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
    nb?.setupWith(content: .white, bg: .orange, isTranslucent: false)
    let ni = navigationItem
    ni.title = CreatePostVC.sb_name
    
    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    
    btn_addCloth.addTarget(self, action: #selector(addClothButtonPressed), for: .touchUpInside)
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = BlankTVC.vc
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func addClothButtonPressed(_ sender: UIButton) {
    //Open cam
    let vc = UIImagePickerController()
    vc.displayImagePicker(on: self)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - UIImagePickerControllerDelegate
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true, completion: nil)
    guard let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    imgv_top.image = img
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
