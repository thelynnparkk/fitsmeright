//
//  PostCreateTagVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift




extension PostCreateTagVC:
  AGVCInstantiatable
{
  
}



class PostCreateTagVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case images([UIImage])
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
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func prepare() {
    super.prepare()
    
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
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
    ni.rightBarButtonItems = [bbi_done]
    
    
    
    //MARK: Component
    imgv_outfit.contentMode = .scaleAspectFill
    imgv_outfit.clipsToBounds = true
    
    tagGesture = UIGestureRecognizer(target: self, action: #selector(onTapGestureRecognized))
    imgv_outfit.addGestureRecognizer(tagGesture)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchOutfit()
  }
  
  
  
  //MARK: - Event
  @objc
  func doneButtonPressed(_ sender: UIButton) {
    delegate_agvc?.agVCPressed(self, action: Action.images([]))
  }
  
  @objc
  func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
//    let location = sender.location(in: imgv_outfit)
    
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
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

