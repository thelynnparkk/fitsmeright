//
//  CreatePostItemListVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreatePostItemListVC:
  AGVCInstantiatable
{
  
}



class CreatePostItemListVC: AGIPC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
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
  var img_clothListSelected: [UIImage] = []
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepare() {
    super.prepare()
    
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
    view.backgroundColor = c_material.grey300
    nb?.setupWith(content: .white, bg: c_custom.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    bbi_cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_cancel]
    bbi_next = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextBarButtonPressed))
    bbi_next.isEnabled = false
    ni.rightBarButtonItems = [bbi_next]
    
    btn_addCloth.addTarget(self, action: #selector(addClothButtonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }

  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  @objc
  func nextBarButtonPressed(_ sender: UIBarButtonItem) {
    let vc = CreatePostDesignVC.vc
    vc.img_clothListSelected = img_clothListSelected
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func addClothButtonPressed(_ sender: UIButton) {
    displayImagePickerAlert()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = CreatePostItemListVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGImagePickerDelegate
  override func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    guard img_clothListSelected.count < 4 else { return }
    img_clothListSelected.append(image)
    let vm = CreatePostViewUC.ViewModel()
    vm.displayedCreatePost.img_clothListSelected = img_clothListSelected
    v_createPost.setupData(with: vm)
    if img_clothListSelected.count == 4 {
      btn_addCloth.isHidden = true
      bbi_next.isEnabled = true
    }
  }
  
  override func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  override func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
