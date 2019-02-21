//
//  PostCreateOutfitVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension PostCreateOutfitVC:
  AGVCDelegate,
  AGViewDelegate,
  AGCADelegate
{
  
}



class PostCreateOutfitVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_close: UIBarButtonItem!
  var bbi_post: UIBarButtonItem!
  var v_state: StateView!
  @IBOutlet weak var txt_caption: UITextField!
  @IBOutlet weak var v_outfit: UIView!
  @IBOutlet weak var lb_outfit: UILabel!
  @IBOutlet weak var imgv_outfit: UIImageView!
  @IBOutlet weak var imgv_outfitAdd: UIImageView!
  @IBOutlet weak var btn_outfit: UIButton!
  @IBOutlet weak var btn_clearOutfit: UIButton!
  @IBOutlet weak var lb_items: UILabel!
  @IBOutlet weak var v_itemSection: UIView!
  @IBOutlet weak var collection_item: UICollectionView!
  var adapter_item: OutfitItemCA!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var closetCategoryListSelected: [ClosetCategory] = []
  var fsClosets: [FSCloset] = []
  
  

  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
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
  
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = .white
    nb?.setupWith(content: c_custom.peach, bg: .white, isTranslucent: false)
    
    
    
    //MARK: Component
    view.setupViewFrame()
    bbi_close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_close]
    bbi_post = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    bbi_post.isEnabled = false
    ni.rightBarButtonItems = [bbi_post]
    
    txt_caption.borderStyle = .none
    let attributedPlaceholder: [NSAttributedString.Key : Any] = [
      .font: UIFont(name: f_system.helvetica, size: f_size.h3)!
    ]
    txt_caption.attributedPlaceholder = NSAttributedString(string: "Add a caption..", attributes: attributedPlaceholder)
    
    v_outfit.addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    lb_outfit.font = UIFont(name: f_system.helveticaBold, size: f_size.h1)
    imgv_outfit.layer.cornerRadius = 20
    imgv_outfit.contentMode = .scaleAspectFill
    imgv_outfit.clipsToBounds = true
    imgv_outfitAdd.image = #imageLiteral(resourceName: "library_add")
    btn_outfit.addTarget(self, action: #selector(outfitButtonPressed), for: .touchUpInside)
    btn_clearOutfit.layer.cornerRadius = btn_clearOutfit.bounds.width / 2
    btn_clearOutfit.addTarget(self, action: #selector(clearOutfitButtonPressed), for: .touchUpInside)
    
    lb_items.font = UIFont(name: f_system.helveticaBold, size: f_size.h1)
    adapter_item = OutfitItemCA(collection: collection_item)
    adapter_item.delegate = self
    
//    vc_panelVC = PanelListVC()
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
    v_state.delegate = self
    view.addSubview(v_state)
    
    
    
    //MARK: Other
    setupClearOutfit()
    
    
    
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
    v_itemSection.isHidden = true
  }
  
  
  
  //MARK: - Setup View
 
  func setupClearOutfit() {
    imgv_outfit.image = UIImage(color: .white, size: .less)
    imgv_outfitAdd.isHidden = false
    btn_clearOutfit.isHidden = true
    btn_outfit.isUserInteractionEnabled = true
    closetCategoryListSelected = []
    fsClosets = []
    adapter_item.setupData(with: .none)
  }
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func postButtonPressed(_ sender: UIBarButtonItem) {
    
  }
  
  @objc
  func outfitButtonPressed(_ sender: UIButton) {
    displayImagePickerPopup()
  }
  
  @objc
  func clearOutfitButtonPressed(_ sender: UIButton) {
    
    setupClearOutfit()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = PostCreateOutfitVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPost
  func fetchClosetCategory(category: Int) {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      worker(userId: fsUser._documentId)
    }
    func worker(userId: String) {
      FSClosetWorker.fetchWhere(userId: userId, category: category) { [weak self] in
        guard let _s = self else { return }
        switch $0.error {
        case .none:
          _s.fsClosets = $0.data
          present($0.data)
        case let .some(e):
          presentError(e)
        }
      }
    }
    func present(_ response: [FSCloset]) {
      func display() {
        v_state.setState(with: .hidden)
        let displayed_ca = ImageCADisplayed()
        let displayed_cc: [AGCCDisplayed] = response.map({ $0.imageURL }).compactMap({
          let displayed = ImageCCDisplayed()
          displayed.imageURL = $0
          return displayed
        })
        let displayed_footer = LabelCRVDisplayed()
        displayed_footer.title = "\(displayed_cc.count) items"
        let section = AGCADisplayed.Section()
        section.footer = displayed_footer
        section.items = displayed_cc
        displayed_ca.sections = [section]
        vc_panelVC = PanelListVC()
        let displayed = PanelListVCUC.Setup.DisplayedSetupPanelList()
        displayed.viewModel = displayed_ca
        displayed.adapter = ImageCA.self
        let vm = PanelListVCUC.Setup.ViewModel()
        vm.displayedSetup = displayed
        vc_panelVC!.setupData(with: vm)
        vc_panelVC!.delegate_agvc = self
        addPanelVC()
      }
      if let vc = vc_panelVC as? PanelListVC {
        vc.removeBottomSheetView()
        SwifterSwift.delay(milliseconds: 300) { [weak self] in
          guard let _ = self else { return }
          display()
        }
      } else {
        display()
      }
    }
    func presentError(_ error: Error) {
      present([])
      v_state.setState(with: .error, isAnimation: false)
      print(error.localizedDescription)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    switch vc {
    case is PanelListVC:
      if let action = action as? PanelListVC.Action {
        switch action {
        case .view(_):
          break
          //        self.removeStickersView()
          //        view.center = canvasImageView.center
          //        self.canvasImageView.addSubview(view)
        //        addGestures(view: view)
        case .image(_):
          break
          //        self.removeStickersView()
          //        let imageView = UIImageView(image: image)
          //        imageView.contentMode = .scaleAspectFit
          //        imageView.frame.size = CGSize(width: 150, height: 150)
          //        imageView.center = canvasImageView.center
          //        self.canvasImageView.addSubview(imageView)
        //        addGestures(view: imageView)
        case let .indexPath(i):
          print(i)
          removePanelVC()
        case .disappear:
          isPanelListVisible = false
        }
      }
    case is PostCreateTagVC:
      if let action = action as? PostCreateTagVC.Action {
        switch action {
        case let .closetCategorys(list):
          dismiss(animated: true) {
            DispatchQueue.main.async { [weak self] in
              guard let _s = self else { return }
              _s.btn_outfit.isUserInteractionEnabled = false
              _s.v_itemSection.isHidden = false
              _s.closetCategoryListSelected = list
              let section = OutfitItemCADisplayed.Section()
              section.items = list.map({
                let displayed = OutfitItemCCDisplayed()
                displayed.icon = $0.icon.filled(withColor: _s.c_custom.peach)
                return displayed
              })
              let displayed = OutfitItemCADisplayed()
              displayed.sections = [section]
              _s.adapter_item.setupData(with: displayed)
            }
          }
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    let closetCategory = closetCategoryListSelected[indexPath.row]
    fetchClosetCategory(category: closetCategory.rawValue)
  }
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    imgv_outfitAdd.isHidden = true
    btn_clearOutfit.isHidden = false
    imgv_outfit.image = image
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      let vc = PostCreateTagVC.vc()
      vc.delegate_agvc = self
      vc.img_outfitSelected = _s.imgv_outfit.image
      let nvc = UINavigationController(rootViewController: vc)
      _s.present(vc: nvc)
    }
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
