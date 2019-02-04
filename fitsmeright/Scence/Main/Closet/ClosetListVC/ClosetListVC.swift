//
//  ClosetListVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ClosetListVC:
  AGVCInstantiatable,
  AGViewDelegate,
  AGCADelegate,
  AGVCDelegate
{
  
}



class ClosetListVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_addClosetFloating: FloatingView!
  var collection_main: UICollectionView!
  var adapter_image: ImageCA!
  
  
  
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
//    view.backgroundColor = c_material.grey300
    view.backgroundColor = .white
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    //    view.setupViewFrame()
    collection_main = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_image = ImageCA(collection: collection_main)
    adapter_image.delegate = self
    view.addSubview(collection_main)
    v_addClosetFloating.delegate = self
    let vm_plus = FloatingViewUC.ViewModel()
    vm_plus.displayedFloating.image = #imageLiteral(resourceName: "plus").filled(withColor: .white)
    v_addClosetFloating.setupData(with: vm_plus)
    view.bringSubviewToFront(v_addClosetFloating)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    collection_main.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchClosets()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetListVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchClosets
  func fetchClosets() {
    
    func interactor() {
      if let _ = closetCategory {
        worker()
      } else {
        navigationController?.popViewController()
      }
    }
    
    func worker() {
      present()
    }
    
    func present() {
      let vm = ImageCAUC.ViewModel()
      vm.displayedItems = fsClosets.compactMap({
        let vm = ImageCCUC.ViewModel()
        vm.displayedImage.imageURL = $0.imageURL
        return vm
      })
      //      vm.displayedFooter.kind = UICollectionView.elementKindSectionFooter
      vm.displayedFooter.title = "\(vm.displayedItems.count) items"
      adapter_image.setupData(with: vm)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    let vc = ClosetFormVC.vc
    vc.closetCategory = closetCategory
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    let vc = ClosetVC.vc
    vc.fsCloset = fsClosets[indexPath.row]
    vc.closetCategory = closetCategory
    vc.delegate_agvc = self
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
    func closet(action: ClosetVC.Action) {
      switch action {
      case let .update(fsCloset):
        if let index = fsClosets.firstIndex(where: { $0._documentId == fsCloset._documentId }) {
          fsClosets[index] = fsCloset
          fetchClosets()
        }
      }
    }
    
    if let action = action as? ClosetVC.Action {
      closet(action: action)
    }
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
