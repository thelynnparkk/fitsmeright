//
//  PostCreateClosetVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension PostCreateClosetVC:
  AGVCInstantiatable,
  AGVCDelegate
{
  
}



class PostCreateClosetVC: AGIPC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_cancel: UIBarButtonItem!
  var bbi_next: UIBarButtonItem!
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var btn_addCloth: UIButton!
  var vc_panelListVC: PanelListVC!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var isPanelListVisible = false
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
    
    vc_panelListVC = PanelListVC()
    
    
    
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
    let vc = PostCreateDesignVC.vc
    vc.img_clothListSelected = img_clothListSelected
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc
  func addClothButtonPressed(_ sender: UIButton) {
    fetchList()
//    displayImagePickerAlert()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = PostCreateClosetVC.sb_name
  }
  
  
  
  //MARK: - Private
  func addPanelVC() {
    isPanelListVisible = true
    vc_panelListVC.delegate_agvc = self
    addChild(vc_panelListVC)
    view.addSubview(vc_panelListVC.view)
    vc_panelListVC.didMove(toParent: self)
    let height = view.frame.height
    let width  = view.frame.width
    vc_panelListVC.view.frame = CGRect(x: 0, y: view.frame.maxY , width: width, height: height)
  }
  
  func removePanelVC() {
    isPanelListVisible = false
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    var frame = self.vc_panelListVC.view.frame
                    frame.origin.y = UIScreen.main.bounds.maxY
                    self.vc_panelListVC.view.frame = frame
                    
    }, completion: { _ in
      self.vc_panelListVC.view.removeFromSuperview()
      self.vc_panelListVC.removeFromParent()
    })
  }
  
  
  
  //MARK: - VIP - FetchList
  func fetchList() {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      presenter()
    }
    
    func presenter() {
      
      let vm = PanelListVCUC.ViewModel()
      let vm_imageCA = ImageCAUC.ViewModel()
      var urls = [
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495936804.jpg?alt=media&token=3b5070b0-7c2e-4ff7-8e9e-ce79aa4215c2",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495953089.jpg?alt=media&token=e53a9fa4-40c0-4e43-b46b-aade819609e1",
        "https://firebasestorage.googleapis.com/v0/b/fitsmeright-8598a.appspot.com/o/closets%2F1548495975284.jpg?alt=media&token=0f7293d4-27a3-4457-ac07-cb7aaba69f8e"
      ]
      urls += urls
      urls += urls
      urls += urls
      //      urls = []
      vm_imageCA.displayedItems = urls.compactMap({
        let vm = ImageCCUC.ViewModel()
        vm.displayedImage.imageUrl = URL(string: $0)
        return vm
      })
      //      vm.displayedFooter.kind = UICollectionView.elementKindSectionFooter
      vm_imageCA.displayedFooter.title = "\(vm_imageCA.displayedItems.count) items"
      vm.displayedList.adapter = ImageCA.self
      vm.displayedList.viewModel = vm_imageCA
      vc_panelListVC.setupData(with: vm)
      addPanelVC()
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    
    func panelList(action: PanelListVC.Action) {
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
      case .disappear:
        isPanelListVisible = false
      }
    }
    
    if let action = action as? PanelListVC.Action {
      panelList(action: action)
    }
    
  }
  
  
  
  //MARK: - Custom - AGImagePickerDelegate
//  override func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
//    picker.dismiss(animated: true, completion: nil)
//    guard img_clothListSelected.count < 4 else { return }
//    img_clothListSelected.append(image)
//    let vm = CreatePostViewUC.ViewModel()
//    vm.displayedCreatePost.img_clothListSelected = img_clothListSelected
//    v_createPost.setupData(with: vm)
//    if img_clothListSelected.count == 4 {
//      btn_addCloth.isHidden = true
//      bbi_next.isEnabled = true
//    }
//  }
//
//  override func didFinishPickingMediaError(_ picker: UIImagePickerController) {
//    picker.dismiss(animated: true, completion: nil)
//  }
//
//  override func didCancelPickingMedia(_ picker: UIImagePickerController) {
//    picker.dismiss(animated: true, completion: nil)
//  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
