//
//  PopupListVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 31/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import SnapKit
import PopupDialog



class PopupListVCUC {
  
  class Setup {
    class DisplayedSetupPopupList: PopupVCUC.Setup.DisplayedSetupPopup {
      var viewModel: AGCADisplayed!
      var adapter: AGCA.Type!
    }
    class ViewModel: PopupVCUC.Setup.ViewModel {
      
    }
  }
  
}



extension PopupListVC:
  UIGestureRecognizerDelegate,
  AGViewDelegate,
  AGCADelegate
{
  
}



class PopupListVC: PopupVC {
  //MARK: - AGInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var v_container: UIView!
  var v_header: PopupHeaderView!
  var collection: UICollectionView!
  var adpater: AGCA!
  var v_footer: PopupFooterView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - LayoutConstraint
  var con_collectionHeight: Constraint!
  
  
  
  //MARK: - Constraint
  typealias UC = PopupListVCUC
  var displayedSetPopupList: UC.Setup.DisplayedSetupPopupList? {
    return displayedSetup as? UC.Setup.DisplayedSetupPopupList
  }
  var con_heightMax: CGFloat {
    return (UIScreen.main.bounds.size.height * CGFloat(0.5))
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var indexPathSeleted: IndexPath?
  
  
  
  //MARK: - Apperance
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override public var prefersStatusBarHidden: Bool {
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
    
    v_container = UIView()
    v_container.backgroundColor = .clear
    
    v_header = PopupHeaderView()
    v_header.backgroundColor = .clear
    
    collection = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adpater = displayedSetPopupList!.adapter!.init(collection: collection)
    adpater.delegate = self
    
    v_footer = PopupFooterView()
    v_footer.backgroundColor = .clear
    v_footer.delegate = self
    
    view.addSubview(v_container)
    v_container.addSubview(v_header)
    v_container.addSubview(collection)
    
    if displayedSetPopupList!.isHideFooter {
      
    } else {
      v_container.addSubview(v_footer)
    }
    
    if displayedSetPopupList!.isTapContainerEnabled {
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
      tapGesture.delegate = self
      tapGesture.cancelsTouchesInView = false
      view.addGestureRecognizer(tapGesture)
    }
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    
    v_header.snp.makeConstraints {
      $0.top.right.left.equalToSuperview()
      $0.height.lessThanOrEqualTo(PopupHeaderView.Sizing.height(style: displayedSetPopupList!.displayedHeader.style))
    }
    
    if displayedSetPopupList!.isHideFooter {
      collection.snp.makeConstraints { [weak self] in
        guard let _s = self else { return }
        $0.top.equalTo(v_header.snp.bottom)
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview()
        $0.left.equalToSuperview()
        _s.con_collectionHeight = $0.height.equalTo(100).constraint
      }
    } else {
      collection.snp.makeConstraints { [weak self] in
        guard let _s = self else { return }
        $0.top.equalTo(v_header.snp.bottom)
        $0.right.equalToSuperview()
        $0.left.equalToSuperview()
        _s.con_collectionHeight = $0.height.equalTo(100).constraint
      }
      
      v_footer.snp.makeConstraints { [weak self] in
        guard let _s = self else { return }
        $0.top.equalTo(_s.collection.snp.bottom)
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview()
        $0.left.equalToSuperview()
        $0.height.equalTo(45)
      }
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchList()
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with viewModel: AGVCUC.Setup.ViewModel?) {
    guard let vm = viewModel else { return }
    displayedSetup = vm.displayedSetup
  }
  
  
  
  //MARK: - Event
  @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
    cancelButtonPressed()
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchList
  func fetchList() {
    
    func interactor() {
      worker()
    }
    
    func worker() {
      presenter()
    }
    
    func presenter() {
      DispatchQueue.main.async { [weak self] in
        guard let _s = self else { return }
        _s.view.setupViewFrame()
        _s.v_header.setupData(with: _s.displayedSetPopupList!.displayedHeader)
        _s.v_footer.setupData(with: _s.displayedSetPopupList!.displayedFooter)
        _s.adpater.setupData(with: _s.displayedSetPopupList!.viewModel)
        if _s.adpater.isSectionEmpty() {
          _s.con_collectionHeight.update(offset: 0)
        } else {
          let h_sum = _s.adpater.height
          if h_sum <= _s.con_heightMax {
            _s.con_collectionHeight.update(offset: h_sum)
          } else {
            _s.con_collectionHeight.update(offset: _s.con_heightMax)
          }
        }
      }
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - UIGestureRecognizerDelegate
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    guard let view = touch.view else { return false }
    return !view.isDescendant(of: collection)
  }
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    
    func popupFooterView(action: PopupFooterView.Action) {
      switch action {
      case .cancel:
        cancelButtonPressed()
      case .ok:
        okButtonPressed()
      }
      
    }
    
    switch view {
    case is PopupFooterView:
      if let action = action as? PopupFooterView.Action {
        popupFooterView(action: action)
      }
    default:
      break
    }
    
  }
  
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    indexPathSeleted = indexPath
    okButtonPressed()
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
