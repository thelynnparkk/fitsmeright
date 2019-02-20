//
//  PostCreateTagVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift




extension PostCreateTagVC:
  AGVCDelegate
{
  
}



class PostCreateTagVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case closetCategorys([ClosetCategory])
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
    view.backgroundColor = c_material.grey300
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
    delegate_agvc?.agVCPressed(self, action: Action.closetCategorys(v_tagList.map({ $0.key })))
  }
  
  @objc
  func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
    point_lastTapped = sender.location(in: imgv_outfit)
    let vc = SelectClosetCategoryVC.vc()
    vc.delegate_agvc = self
    let nvc = UINavigationController(rootViewController: vc)
    present(vc: nvc)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = PostCreateTagVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
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
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {
    switch vc {
    case is SelectClosetCategoryVC:
      if let closetCategory = action as? ClosetCategory, let point_lastTapped = point_lastTapped {
        vc.dismiss(animated: true) {
          DispatchQueue.main.async { [weak self] in
            guard let _s = self else { return }
            if let view = _s.v_tagList[closetCategory] {
              view.removeFromSuperview()
              _s.v_tagList.removeValue(forKey: closetCategory)
            }
            let view = UIView()
            view.frame = CGRect(origin: point_lastTapped, size: CGSize(side: 20))
            view.layer.cornerRadius = 10
            view.backgroundColor = _s.c_custom.peach
            _s.imgv_outfit.addSubview(view)
            _s.v_tagList[closetCategory] = view
            _s.bbi_done.isEnabled = true
          }
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

