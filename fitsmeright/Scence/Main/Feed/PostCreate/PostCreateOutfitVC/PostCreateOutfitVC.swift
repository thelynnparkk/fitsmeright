//
//  PostCreateOutfitVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension PostCreateOutfitVC:
  AGVCInstantiatable,
  AGVCDelegate,
  AGViewDelegate
{
  
}



class PostCreateOutfitVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_close: UIBarButtonItem!
  var bbi_post: UIBarButtonItem!
  var v_state: StateView!
  
  @IBOutlet weak var v_outfit: UIView!
  @IBOutlet weak var imgv_outfit: UIImageView!
  @IBOutlet weak var btn_outfit: UIButton!
  @IBOutlet weak var btn_clearOutfit: UIButton!
  
  @IBOutlet weak var v_itemSection: UIView!
  @IBOutlet weak var collection_item: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
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
    view.backgroundColor = c_material.grey300
    nb?.setupWith(content: c_custom.peach, bg: .white, isTranslucent: false)



    //MARK: Component
    view.setupViewFrame()
    bbi_close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_close]
    bbi_post = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postButtonPressed))
    bbi_post.isEnabled = false
    ni.rightBarButtonItems = [bbi_post]

    v_outfit.addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.3)
    imgv_outfit.layer.cornerRadius = 8
    imgv_outfit.contentMode = .scaleAspectFill
    imgv_outfit.clipsToBounds = true
    btn_outfit.addTarget(self, action: #selector(outfitButtonPressed), for: .touchUpInside)
    btn_clearOutfit.layer.cornerRadius = btn_clearOutfit.bounds.width / 2
    btn_clearOutfit.addTarget(self, action: #selector(clearOutfitButtonPressed), for: .touchUpInside)
    
    vc_panelVC = PanelListVC()
    
    v_state = StateView(viewModel: StateView.light, axis: .vertical)
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
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  func setupClearOutfit() {
    imgv_outfit.image = UIImage(color: c_material.grey200, size: .less)
    btn_clearOutfit.isHidden = true
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    v_itemSection.isHidden = true
  }
  
  
  
  //MARK: - Event
  @objc
  func postButtonPressed(_ sender: UIBarButtonItem) {
    fetchPost()
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
  func fetchPost() {
    
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      worker()
    }
    
    func worker() {
      presenter()
    }
    
    func presenter() {
      v_state.setState(with: .hidden)
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
        case .images(_):
          dismiss(animated: true) {
            DispatchQueue.main.async {
              
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
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
//    bbi_done.isEnabled = true
    btn_clearOutfit.isHidden = false
    imgv_outfit.image = image
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      let vc = PostCreateTagVC.vc
      vc.delegate_agvc = self
      vc.img_outfitSelected = _s.imgv_outfit.image
      let nvc = UINavigationController(rootViewController: vc)
      _s.present(nvc)
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
