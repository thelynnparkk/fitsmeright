//
//  PostCreateTagVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift




extension PostCreateTagVC:
  AGVCDelegate,
  AGViewDelegate
{
  
}



class PostCreateTagVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case closetCategorys([(ClosetCategory, Float, Float, String)])
  }
  
  
  
  //MARK: - UI
  var bbi_done: UIBarButtonItem!
  @IBOutlet weak var imgv_outfit: UIImageView!
  var tagGesture: UIGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var img_outfitSelected: UIImage?
  var point_lastTapped: CGPoint?
  var v_tagList: [ClosetCategory: UIView] = [:]
  
  
  
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
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = .white
    nb?.setupWith(content: c_custom.peach, bg: .white, isTranslucent: false)
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
    bbi_done.isEnabled = false
    ni.rightBarButtonItems = [bbi_done]
    
    
    
    //MARK: Component
    imgv_outfit.contentMode = .scaleAspectFill
    imgv_outfit.clipsToBounds = true
    imgv_outfit.isUserInteractionEnabled = true
    
    tagGesture = UITapGestureRecognizer(target: self, action: #selector(onTapGestureRecognized))
    imgv_outfit.addGestureRecognizer(tagGesture)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchOutfit()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func doneButtonPressed(_ sender: UIButton) {
    var postClosets: [(ClosetCategory, Float, Float, String)] = []
    for i in v_tagList {
      var postCloset: (ClosetCategory, Float, Float, String) = (ClosetCategory.default, 0, 0, "")
      postCloset.0 = i.key
      let view = v_tagList[i.key]!
      let x = (view.frame.origin.x / imgv_outfit.frame.height)
      let y = (view.frame.origin.y / imgv_outfit.frame.width)
      postCloset.1 = x.float
      postCloset.2 = y.float
      postClosets.append(postCloset)
    }
    delegate_agvc?.agVCPressed(self, action: Action.closetCategorys(postClosets))
  }
  
  @objc
  func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
    point_lastTapped = sender.location(in: imgv_outfit)
    let vc = SelectClosetCategoryVC.vc()
    vc.delegate_agvc = self
    let nvc = UINavigationController(rootViewController: vc)
    present(nvc, animated: true)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ""
  }
  
  
  
  //MARK: - Private
  private func displayAddClosetTag(origin: CGPoint, closetCategory: ClosetCategory) {
    let view = ClosetTagView()
    view.tag = closetCategory.rawValue
    view.frame = CGRect(origin: origin, size: CGSize(side: 40))
    view.delegate = self
    let displayed = ClosetTagViewDisplayed()
    displayed.icon = closetCategory.icon.filled(withColor: .white)
    view.setupData(with: displayed)
    imgv_outfit.addSubview(view)
    v_tagList[closetCategory] = view
    bbi_done.isEnabled = true
  }
  
  
  
  //MARK: - VIP - FetchOutfit
  func fetchOutfit() {
    func interactor() {
      worker()
    }
    func worker() {
      present()
    }
    func present() {
      imgv_outfit.image = img_outfitSelected
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_delete = LabelCCDisplayed()
      displayed_delete.title = "Delete"
      displayed_delete.style = .normal
      let displayed_cancel = LabelCCDisplayed()
      displayed_cancel.title = "Cancel"
      displayed_cancel.weight = .semibold
      displayed_cancel.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_delete, displayed_cancel]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_trash").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Please confirm to delete tagged item."
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Delete item?"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _ = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        view.fadeOut(duration: 0.2) { [weak self] bool in
          guard let _s = self else { return }
          view.removeFromSuperview()
          _s.v_tagList.removeValue(forKey: ClosetCategory(rawValue: tag)!)
        }
      case 1:
        break
      default:
        break
      }
    }
  }

  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    switch vc {
    case is SelectClosetCategoryVC:
      if let closetCategory = action as? ClosetCategory, let point_lastTapped = point_lastTapped {
        vc.dismiss(animated: true) {
          DispatchQueue.main.async { [weak self] in
            guard let _s = self else { return }
            if let view = _s.v_tagList[closetCategory] {
              view.fadeOut(duration: 0.2) { [weak self] bool in
                guard let _s = self else { return }
                view.removeFromSuperview()
                _s.v_tagList.removeValue(forKey: closetCategory)
                _s.displayAddClosetTag(origin: point_lastTapped, closetCategory: closetCategory)
              }
            } else {
              _s.displayAddClosetTag(origin: point_lastTapped, closetCategory: closetCategory)
            }
          }
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

