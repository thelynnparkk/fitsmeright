//
//  ClosetDetailVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ClosetDetailVC:
  AGVCInstantiatable
{
  
}



class ClosetDetailVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
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
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetDetailVC.sb_name
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
      v_brand.setup(key: "Brand", value: fsCloset!._brand)
      v_price.setup(key: "Price", value: "\(fsCloset!._price)")
      v_size.setup(key: "Size", value: fsCloset!._size)
      v_place.setup(key: "Place", value: fsCloset!._place)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
