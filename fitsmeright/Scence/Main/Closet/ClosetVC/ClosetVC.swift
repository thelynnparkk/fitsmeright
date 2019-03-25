//
//  ClosetVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension ClosetVC:
  AGVCDelegate,
  AGViewDelegate,
  AGCADelegate
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
  var v_state: StateView!
  var adapter_relate: ClosetRelateCA!
  @IBOutlet weak var collection_relate: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var isEditable = true
  var fsCloset: FSCloset?
  var closetCategory: ClosetCategory?
  var postList: [Post] = []
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = .white
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    if isEditable {
      bbi_edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClosetPressed))
      ni.rightBarButtonItems = [bbi_edit]
    }
    
    
    
    //MARK: Component
    sv_container.setupScrollVertical()
    v_seperator.backgroundColor = c_material.grey300
    
    adapter_relate = ClosetRelateCA(collection: collection_relate)
    adapter_relate.delegate = self
    
    collection_relate.isHidden = true
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    
    view.addSubview(v_state)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_state.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchCloset()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc func editClosetPressed(_ sender: UIButton) {
    let vc = ClosetFormVC.vc()
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
    var fsPostClosetList: [FSPostCloset] = []
    var fsPostList: [FSPost] = []
    var postList: [Post] = []
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      guard let _ = closetCategory, let closet = fsCloset else {
        presenterError()
        return
      }
      worker(closetId: closet._documentId)
    }
    func worker(closetId: String) {
      func fetchPostCloset() {
        FSPostClosetWorker.fetchWhere(closetId: closetId) { [weak self] in
          guard let _ = self else { return }
          switch $0.error {
          case .none:
            fsPostClosetList = $0.data
            fetchPost(fsPostClosetList: fsPostClosetList)
          case let .some(e):
            print(e.localizedDescription)
            presenterError()
          }
        }
      }
      func fetchPost(fsPostClosetList: [FSPostCloset]) {
        let dg = DispatchGroup()
        for i in fsPostClosetList {
          dg.enter()
          FSPostWorker.get(documentId: i._postId) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
              fsPostList.append($0.data)
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          presenter()
        }
      }
      fetchPostCloset()
    }
    func presenter() {
      v_state.setState(with: .hidden, isAnimation: false)
      ni.title = closetCategory!.name.capitalized
      if let imageURL = fsCloset!.imageURL {
        imgv_closet.kf.setImage(with: imageURL, placeholder: nil, options: nil)
      } else {
        imgv_closet.image = nil
      }
      let vm_brand = ClosetFormViewDisplayed()
      vm_brand.key = "Brand"
      vm_brand.value = fsCloset!._brand
      vm_brand.isEditable = false
      let vm_price = ClosetFormViewDisplayed()
      vm_price.key = "Price"
      vm_price.value = "\(fsCloset!._price)"
      vm_price.isEditable = false
      let vm_size = ClosetFormViewDisplayed()
      vm_size.key = "Size"
      vm_size.value = fsCloset!._size
      vm_size.isEditable = false
      let vm_place = ClosetFormViewDisplayed()
      vm_place.key = "Place"
      vm_place.value = fsCloset!._place
      vm_place.isEditable = false
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      v_place.setupData(with: vm_place)
      if !fsPostClosetList.isEmpty {
        collection_relate.isHidden = false
        for p in fsPostList {
          let post = Post()
          post.fsPost = p
          postList.append(post)
        }
        self.postList = postList
        let header = LabelCRVDisplayed()
        header.title = "Relate Items"
        let section = ClosetRelateCADisplayed.Section()
        let items = OutfitItemXCCDisplayed()
        items.items = postList.map({
          let displayed = OutfitItemCCDisplayed()
          displayed.imageURL = $0._fsPost.imageURL
          return displayed
        })
        section.header = header
        section.items = [items]
        let displayed = ClosetRelateCADisplayed()
        displayed.sections = [section]
        adapter_relate.setupData(with: displayed)
      }
    }
    func presenterError() {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
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
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
    case is StateView:
      if let state = action as? StateView.State {
        switch state {
        case .hidden:
          break
        case .loading:
          break
        case .noResults:
          break
        case .noConnection:
          break
        case .error:
          nc?.popViewController()
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
//    if let action = action as? ClosetRelateCA.Action {
//
//    }
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
