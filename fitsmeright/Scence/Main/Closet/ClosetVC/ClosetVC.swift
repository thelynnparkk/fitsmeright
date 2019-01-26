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
  AGVCDelegate
{
  
}



class ClosetVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case update(FSCloset)
  }
  
  
  
  //MARK: - UI
  var bbi_edit: UIBarButtonItem!
  @IBOutlet weak var sv_container: UIScrollView!
  @IBOutlet weak var imgv_closet: UIImageView!
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var v_brand: ClosetFormView!
  @IBOutlet weak var v_price: ClosetFormView!
  @IBOutlet weak var v_size: ClosetFormView!
  @IBOutlet weak var v_place: ClosetFormView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsCloset: FSCloset?
  var closetCategory: ClosetCategory?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
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
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    bbi_edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClosetPressed))
    ni.rightBarButtonItems = [bbi_edit]
    
    
    
    //MARK: Component
    sv_container.setupScrollVertical()
    v_seperator.backgroundColor = c_material.grey300
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchCloset()
  }
  
  
  
  //MARK: - Event
  @objc func editClosetPressed(_ sender: UIButton) {
    let vc = ClosetFormVC.vc
    vc.closetCategory = closetCategory
    vc.fsCloset = fsCloset
    vc.delegate_agvc = self
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchCloset
  func fetchCloset() {
    
    func interactor() {
      if let _ = closetCategory, let _ = fsCloset {
        worker()
      } else {
        navigationController?.popViewController()
      }
    }
    
    func worker() {
      present()
    }
    
    func present() {
      ni.title = closetCategory!.name.uppercased()
      if let imageURL = fsCloset!.imageURL {
        imgv_closet.download(from: imageURL, contentMode: .scaleAspectFit, placeholder: nil)
      } else {
        imgv_closet.image = nil
      }
      let vm_brand = ClosetFormViewUC.ViewModel()
      vm_brand.displayedForm.key = "Brand"
      vm_brand.displayedForm.value = fsCloset!._brand
      vm_brand.displayedForm.isEditable = false
      let vm_price = ClosetFormViewUC.ViewModel()
      vm_price.displayedForm.key = "Price"
      vm_price.displayedForm.value = "\(fsCloset!._price)"
      vm_price.displayedForm.isEditable = false
      let vm_size = ClosetFormViewUC.ViewModel()
      vm_size.displayedForm.key = "Size"
      vm_size.displayedForm.value = fsCloset!._size
      vm_size.displayedForm.isEditable = false
      let vm_place = ClosetFormViewUC.ViewModel()
      vm_place.displayedForm.key = "Place"
      vm_place.displayedForm.value = fsCloset!._place
      vm_place.displayedForm.isEditable = false
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      v_place.setupData(with: vm_place)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ view: AGVC, action: Any) {
    
    func closetForm(action: ClosetFormVC.Action) {
      switch action {
      case let .update(fsCloset):
        navigationController?.popViewController(animated: true) { [weak self] in
          guard let _s = self else { return }
          _s.fsCloset = fsCloset
          _s.fetchCloset()
          _s.delegate_agvc?.agVCPressed(_s, action: Action.update(fsCloset))
        }
      }
    }
    
    if let action = action as? ClosetFormVC.Action {
      closetForm(action: action)
    }
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
