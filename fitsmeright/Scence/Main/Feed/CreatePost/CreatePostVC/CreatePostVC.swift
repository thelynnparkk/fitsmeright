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
  AGImagePCDelegate
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
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var btn_addCloth: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var img_clothSelected: [UIImage] = []
  
  
  
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
    //MARK: Core
    let nb = navigationController?.navigationBar
    let c = R.Value.Color.self
    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    let ni = navigationItem
    ni.title = CreatePostVC.sb_name
    
    
    
    //MARK: UI
    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    bbi_next.isEnabled = false
    ni.rightBarButtonItems = [bbi_next]
    
    btn_addCloth.addTarget(self, action: #selector(addClothButtonPressed), for: .touchUpInside)
    
    
    
    //MARK: Misc
    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = CreatePostDesignVC.vc
    vc.img_clothSelected = img_clothSelected
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func addClothButtonPressed(_ sender: UIButton) {
    AGImagePC.displaySourcePopup(on: self) 
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGImagePickerDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, with image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    guard img_clothSelected.count < 4 else { return }
    switch img_clothSelected.count {
    case 0:
      v_createPost.imgv_01.image = image
    case 1:
      v_createPost.imgv_02.image = image
    case 2:
      v_createPost.imgv_03.image = image
    case 3:
      v_createPost.imgv_04.image = image
      btn_addCloth.isHidden = true
      bbi_next.isEnabled = true
    default:
      return
    }
    img_clothSelected.append(image)
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
