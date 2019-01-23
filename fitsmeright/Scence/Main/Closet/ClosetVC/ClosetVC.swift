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
  FloatingViewDelegate
{
  
}



class ClosetVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_title: UILabel!
  
  @IBOutlet weak var v_addClosetFloating: FloatingView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsClosets: [FSCloset] = []
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
    lb_title.text = ClosetVC.sb_name
    v_addClosetFloating.delegate = self
    v_addClosetFloating.setup(image: #imageLiteral(resourceName: "ic_more").filled(withColor: .white))
    
    
    
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
    ni.title = ClosetVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  func fetchCloset() {
    
    func interactor() {
      if let _ = closetCategory {
        present()
      } else {
        navigationController?.popViewController()
      }
    }
    
    func present() {
      lb_title.text = "\(fsClosets.count) \(closetCategory!.plural)"
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - FloatingViewDelegate
  func floatingViewPressed(_ view: UIView) {
    let vc = AddClosetVC.vc
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
