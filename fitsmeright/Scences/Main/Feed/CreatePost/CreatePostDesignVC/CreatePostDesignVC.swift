//
//  CreatePostEditVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 13/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreatePostDesignVC:
  AGVCInstantiatable,
  AGImagePCDelegate
{
  
}



class CreatePostDesignVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "CreatePostDesignVC"
  static var vc_name: String = "CreatePostDesignVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var btn_addText: UIButton!
  @IBOutlet weak var btn_brush: UIButton!
  @IBOutlet weak var btn_addBackground: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var img_clothSelected: [UIImage] = []
  var img_backgroundSelected: UIImage?
  
  
  
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
    let c = R.Value.Color.self
    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    let ni = navigationItem
    ni.title = CreatePostDesignVC.sb_name
    
    bbi_cancel = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    ni.rightBarButtonItems = [bbi_next]
    
    v_createPost.imgv_01.contentMode = .scaleAspectFit
    v_createPost.imgv_02.contentMode = .scaleAspectFit
    v_createPost.imgv_03.contentMode = .scaleAspectFit
    v_createPost.imgv_04.contentMode = .scaleAspectFit
    v_createPost.imgv_background.contentMode = .scaleAspectFit
    
    btn_addBackground.addTarget(self, action: #selector(changeBackgroundButtonPressed), for: .touchUpInside)
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    setupSelectImageData()
  }
  
  func setupSelectImageData() {
    v_createPost.imgv_01.image = img_clothSelected[0]
    v_createPost.imgv_02.image = img_clothSelected[1]
    v_createPost.imgv_03.image = img_clothSelected[2]
    v_createPost.imgv_04.image = img_clothSelected[3]
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = BlankTVC.vc
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func changeBackgroundButtonPressed(_ sender: UIButton) {
    AGImagePC.displaySourcePopup(on: self)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGImagePickerDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, with image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    v_createPost.imgv_background.image = image
    img_backgroundSelected = image
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
