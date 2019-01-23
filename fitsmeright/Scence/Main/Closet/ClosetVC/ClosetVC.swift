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
  AGViewDelegate,
  AGCADelegate
{
  
}



class ClosetVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_title: UILabel!
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
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    
    
    
    //MARK: Component
    view.setupViewFrame()
    collection_main = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adapter_image = ImageCA(collection: collection_main)
    adapter_image.delegate = self
    view.addSubview(collection_main)
    v_addClosetFloating.delegate = self
    v_addClosetFloating.setup(image: #imageLiteral(resourceName: "ic_more").filled(withColor: .white))
    
    
    
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
    fetchCloset()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetVC.sb_name
    lb_title.text = ClosetVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  func fetchCloset() {
    
    func interactor() {
      if let _ = closetCategory {
        worker()
      } else {
        navigationController?.popViewController()
      }
    }
    
    func worker() {
//      mockMainWaiting(1) {
        present()
//      }
    }
    
    func present() {
      lb_title.text = "\(fsClosets.count) \(closetCategory!.plural)"
      let model = ImageCAModel()
      model.displayedRows = fsClosets.compactMap({
        let model = ImageCCModel()
        model.imageUrl = $0.imageURL
        return model
      })
      adapter_image.setupData(with: model)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: UIView) {
    let vc = AddClosetVC.vc
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    print("indexPath: \(indexPath)")
  }
  
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
