//
//  PopupListVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 31/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import SnapKit
import PopupDialog



class PopupListVCUC {
  
  class DisplayedList {
    var viewModel: AGCAModel!
    var adapter: AGCA.Type!
    var tapDismissal = true
    var tapGesture = false
    var isHideFooter = false
  }
  
  class ViewModel: PopupVCModel {
    var displayedHeader = PopupHeaderViewUC.DisplayedHeader()
    var displayedFooter = PopupFooterViewUC.DisplayedFooter()
    var displayedList = DisplayedList()
  }
  
}



extension PopupListVC:
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
  typealias ViewModel = PopupListVCUC.ViewModel
  var con_heightMax: CGFloat {
    return (UIScreen.main.bounds.size.height * CGFloat(0.5))
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var viewModel = PopupListVCUC.ViewModel()
  var indexPathSeleted: IndexPath?
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override public var prefersStatusBarHidden: Bool {
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
    view.backgroundColor = .white
    
    v_container = UIView()
    v_container.backgroundColor = .clear
    
    v_header = PopupHeaderView()
    v_header.backgroundColor = .clear
    
    collection = ControlContainableCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    adpater = viewModel.displayedList.adapter!.init(collection: collection)
    adpater.delegate = self
    
    v_footer = PopupFooterView()
    v_footer.backgroundColor = .clear
    v_footer.delegate = self
    
    view.addSubview(v_container)
    v_container.addSubview(v_header)
    v_container.addSubview(collection)
    
    if viewModel.displayedList.isHideFooter {
//      tapgr_container = UITapGestureRecognizer(target: self, action: #selector(okButtonPressed))
//      v_container.addGestureRecognizer(tapgr_container)
    } else {
      v_container.addSubview(v_footer)
    }
    
    if viewModel.displayedList.tapGesture {
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapGestureRecognized))
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
      $0.height.lessThanOrEqualTo(PopupHeaderView.Sizing.height(style: viewModel.displayedHeader.style))
    }
    
    if viewModel.displayedList.isHideFooter {
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
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchList()
  }
  
  override func setupData(with viewModel: PopupVCModel) {
    guard let vm = viewModel as? ViewModel else { return }
    self.viewModel = vm
  }
  
  
  
  //MARK: - Event
  @objc func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
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
        let vm_header = PopupHeaderViewUC.ViewModel()
        vm_header.displayedHeader = _s.viewModel.displayedHeader
        let vm_footer = PopupFooterViewUC.ViewModel()
        vm_footer.displayedFooter = _s.viewModel.displayedFooter
        _s.v_header.setupData(with: vm_header)
        _s.v_footer.setupData(with: vm_footer)
        _s.adpater.setupData(with: _s.viewModel.displayedList.viewModel)
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
  
  
  
  //MARK: - Core - Protocol
  
  
  
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
