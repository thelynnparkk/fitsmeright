//
//  PostCreateOutfitVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import FirebaseStorage
import FirebaseFirestore



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
  var postClosetListSelected: [(ClosetCategory, Float, Float, String)] = []
  var fsClosets: [FSCloset] = []
  var fsClosetsByClosetCategory: [FSCloset] = []
  var collectionItemSelected: IndexPath?
  
  

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
    bbi_post = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(postButtonPressed))
    bbi_post.isEnabled = false
    ni.rightBarButtonItems = [bbi_post]
    
    txt_caption.borderStyle = .none
    let attributedPlaceholder: [NSAttributedString.Key : Any] = [
      .font: UIFont(name: f_system.helvetica, size: f_size.h4)!
    ]
    txt_caption.attributedPlaceholder = NSAttributedString(string: "Add a caption..", attributes: attributedPlaceholder)
    
    v_outfit.addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    lb_outfit.font = UIFont(name: f_system.helveticaBold, size: f_size.h2)
    imgv_outfit.layer.cornerRadius = 20
    imgv_outfit.contentMode = .scaleAspectFill
    imgv_outfit.clipsToBounds = true
    imgv_outfitAdd.image = #imageLiteral(resourceName: "ic_add_outfit")
    btn_outfit.addTarget(self, action: #selector(outfitButtonPressed), for: .touchUpInside)
    btn_clearOutfit.layer.cornerRadius = btn_clearOutfit.bounds.width / 2
    btn_clearOutfit.addTarget(self, action: #selector(clearOutfitButtonPressed), for: .touchUpInside)
    
    lb_items.font = UIFont(name: f_system.helveticaBold, size: f_size.h2)
    adapter_item = OutfitItemCA(collection: collection_item)
    adapter_item.delegate = self
    
    v_state = StateView(axis: .vertical)
    v_state.setupDark()
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
    fetchClosetCategory()
  }
  
  
  
  //MARK: - Setup View
 
  func setupClearOutfit() {
    imgv_outfit.image = UIImage(color: .white, size: .less)
    imgv_outfitAdd.isHidden = false
    btn_clearOutfit.isHidden = true
    btn_outfit.isUserInteractionEnabled = true
    postClosetListSelected = []
    fsClosets = []
    adapter_item.setupData(with: .none)
  }
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func postButtonPressed(_ sender: UIBarButtonItem) {
    addPost()
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
    ni.title = ""
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchPostListCAtegory
  func fetchClosetCategory() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      let fsUser = UserDefaults.FSUserDefault.get()!
      worker(userId: fsUser._documentId)
    }
    func worker(userId: String) {
      FSClosetWorker.fetchWhere(userId: userId) { [weak self] in
        guard let _s = self else { return }
        switch $0.error {
        case .none:
          _s.fsClosets = $0.data
          present($0.data)
        case let .some(e):
          presentError()
          print(e.localizedDescription)
        }
      }
    }
    func present(_ response: [FSCloset]) {
      v_state.setState(with: .hidden)
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchPostListCAtegory
  func fetchClosetCategory(category: Int) {
    func interactor() {
      worker()
    }
    func worker() {
      fsClosetsByClosetCategory = fsClosets.filter({ $0._category == category })
      present(fsClosetsByClosetCategory)
    }
    func present(_ response: [FSCloset]) {
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
      let displayed = PanelListVCUC.Setup.DisplayedSetupPanelList()
      displayed.viewModel = displayed_ca
      displayed.adapter = ImageCA.self
      let vm = PanelListVCUC.Setup.ViewModel()
      vm.displayedSetup = displayed
      if isPanelListVisible {
        vc_panelVC!.setupData(with: vm)
      } else {
        vc_panelVC = PanelListVC()
        vc_panelVC!.setupData(with: vm)
        vc_panelVC!.delegate_agvc = self
        addPanelVC()
      }
    }
    interactor()
  }
  
  
  
  
  //MARK: - VIP - AddPost
  func addPost() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      bbi_post.isEnabled = false
      let fsUser = UserDefaults.FSUserDefault.get()!
      let fsPost = FSPost()
      fsPost.userId = fsUser._documentId
      fsPost.caption = txt_caption.text
      fsPost.updatedAt = Timestamp(date: Date())
      worker(fsPost: fsPost)
    }
    func worker(fsPost: FSPost) {
      func uploadClosetImage() {
        FSWorker.uploadImage(folder: SPost.folder, image: imgv_outfit.image) {
          switch $0.error {
          case .none:
            fsPost.image = $0.url?.absoluteString
            addPost()
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      func addPost() {
        FSPostWorker.add(fsPost: fsPost) {
          switch $0.error {
          case .none:
            addPostCloset(ref: $0.ref!)
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      func addPostCloset(ref: DocumentReference) {
        let dg = DispatchGroup()
        for i in postClosetListSelected {
          let fsPostCloset = FSPostCloset()
          fsPostCloset.postId = ref.documentID
          fsPostCloset.locationPercentX = i.1
          fsPostCloset.locationPercentY = i.2
          fsPostCloset.closetId = i.3
          fsPostCloset.updatedAt = Timestamp(date: Date())
          dg.enter()
          FSPostClosetWorker.add(fsPost: fsPostCloset) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0.error {
            case .none:
               break
            case let .some(e):
              print(e.localizedDescription)
            }
          }
        }
        dg.notify(queue: .main) {
          present()
        }
      }
      uploadClosetImage()
    }
    func present() {
      v_state.setState(with: .hidden)
      delegate_agvc?.agVCPressed(self, action: [])
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
      bbi_post.isEnabled = true
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
        case .image(_):
          break
        case let .indexPath(i):
          removePanelVC()
          let displayed = OutfitItemCCDisplayed()
          displayed.imageURL = fsClosetsByClosetCategory[i.row].imageURL
          adapter_item.displayedCA.sections[collectionItemSelected!.section].items[collectionItemSelected!.row] = displayed
          adapter_item.collection.reloadItems(at: [collectionItemSelected!])
          let items = adapter_item.displayedCA.sections[collectionItemSelected!.section].items as! [OutfitItemCCDisplayed]
          bbi_post.isEnabled = items.filter({ $0.imageURL == nil }).isEmpty
          postClosetListSelected[collectionItemSelected!.row].3 = fsClosetsByClosetCategory[i.row]._documentId
          collectionItemSelected = nil
          fsClosetsByClosetCategory = []
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
              _s.postClosetListSelected = list
              let section = OutfitItemCADisplayed.Section()
              section.items = list.map({
                let displayed = OutfitItemCCDisplayed()
                displayed.icon = $0.0.icon.filled(withColor: _s.c_custom.peach)
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
    collectionItemSelected = indexPath
    let closetCategory = postClosetListSelected[indexPath.row]
    fetchClosetCategory(category: closetCategory.0.rawValue)
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
