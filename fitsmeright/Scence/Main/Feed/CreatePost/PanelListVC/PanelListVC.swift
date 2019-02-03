//
//  PanelListVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 1/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import SnapKit



class PanelListVCUC {
  
  class DisplayedList {
    var viewModel: AGCAModel!
    var adapter: AGCA.Type!
  }
  
  class ViewModel: AGVCModel {
    var displayedList = DisplayedList()
  }
  
}




extension PanelListVC:
  UIGestureRecognizerDelegate,
  AGCADelegate
{
  
}



class PanelListVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case view(UIView)
    case image(UIView)
    case disappear
  }
  
  
  
  //MARK: - UI
  var v_header: UIView!
  var v_holder: UIView!
  var collection: UICollectionView!
  var adpater: AGCA!
  var panGesture: UIPanGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = PanelListVCUC.ViewModel
  var screenSize: CGSize {
    return UIScreen.main.bounds.size
  }
  var fullView: CGFloat {
    // remainder of screen height
    return 100
  }
  var partialView: CGFloat {
    return UIScreen.main.bounds.height - 380
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var viewModel = PanelListVCUC.ViewModel()
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
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
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    view.backgroundColor = .white
    
    
    
    //MARK: Component
    v_header = UIView()
    v_header.backgroundColor = c_custom.peach
    
    v_holder = UIView()
    v_holder.backgroundColor = .white
    v_holder.layer.cornerRadius = 3
    
    collection = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adpater = viewModel.displayedList.adapter!.init(collection: collection)
    adpater.delegate = self
    collection.insetsLayoutMarginsFromSafeArea = true
    collection.contentInsetAdjustmentBehavior = .always
//    additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPanGestureRecognized))
    panGesture.delegate = self
    view.addGestureRecognizer(panGesture)
    
    view.addSubview(v_header)
    v_header.addSubview(v_holder)
    view.addSubview(collection)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_header.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(40)
    }
    
    v_holder.snp.makeConstraints {
      $0.top.equalToSuperview().offset(5)
      $0.centerX.equalToSuperview()
      $0.width.equalTo(50)
      $0.height.equalTo(5)
    }
    
    collection.snp.makeConstraints { [weak self] in
      guard let _s = self else { return }
      $0.top.equalTo(_s.v_header.snp.bottom)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidAppear() {
    //MARK: Core
    
    
    
    //MARK: Component
    UIView.animate(withDuration: 0.3) {
      let frame = self.view.frame
      let yComponent = self.partialView
      self.view.frame = CGRect(x: 0,
                             y: yComponent,
                             width: frame.width,
                             height: UIScreen.main.bounds.height - self.partialView)
    }
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchList()
  }
  
  override func setupData(with viewModel: AGVCModel) {
    guard let vm = viewModel as? ViewModel else { return }
    self.viewModel = vm
  }
  
  
  
  //MARK: - Event
  @objc func onPanGestureRecognized(_ recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: view)
    let velocity = recognizer.velocity(in: view)

    let y = view.frame.minY
    if y + translation.y >= fullView {
      let newMinY = y + translation.y
      view.frame = CGRect(x: 0, y: newMinY, width: view.frame.width, height: UIScreen.main.bounds.height - newMinY )
      view.layoutIfNeeded()
      recognizer.setTranslation(CGPoint.zero, in: view)
    }

    if recognizer.state == .ended {
      var duration = velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
      duration = duration > 0.5 ? 0.5 : duration
      //velocity is direction of gesture
      UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
        if  velocity.y >= 0 {
          if y + translation.y >= self.partialView  {
            self.removeBottomSheetView()
          } else {
            self.view.frame = CGRect(x: 0, y: self.partialView,
                                     width: self.view.frame.width, height: UIScreen.main.bounds.height - self.partialView)
            self.view.layoutIfNeeded()
          }
        } else {
          if y + translation.y >= self.partialView  {
            self.view.frame = CGRect(x: 0, y: self.partialView,
                                     width: self.view.frame.width, height: UIScreen.main.bounds.height - self.partialView)
            self.view.layoutIfNeeded()
          } else {
            self.view.frame = CGRect(x: 0, y: self.fullView,
                                     width: self.view.frame.width, height: UIScreen.main.bounds.height - self.fullView)
            self.view.layoutIfNeeded()
          }
        }

      }, completion: nil)
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  func removeBottomSheetView() {
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    var frame = self.view.frame
                    frame.origin.y = UIScreen.main.bounds.maxY
                    self.view.frame = frame
                    
    }, completion: { _ in
      self.view.removeFromSuperview()
      self.removeFromParent()
      self.delegate_agvc?.agVCPressed(self, action: Action.disappear)
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
      view.setupViewFrame()
      adpater.setupData(with: viewModel.displayedList.viewModel)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

