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
    var tapGesture = true
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
  var tapgr_container: UIGestureRecognizer!
  var v_header: PopupHeaderView!
  var collection: UICollectionView!
  var adpater: AGCA!
  var v_footer: PopupFooterView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - LayoutConstraint
  var con_containerStackViewTop: Constraint!
  var con_containerStackViewBottom: Constraint!
  
  
  
  //MARK: - Constraint
  typealias ViewModel = PopupListVCUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var flag_hideFooter = false
  
  
  
  //MARK: - Storage
  var viewModel = PopupListVCUC.ViewModel()
  
  
  
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
    
    if !flag_hideFooter {
      v_container.addSubview(v_footer)
    } else {
      tapgr_container = UITapGestureRecognizer(target: self, action: #selector(okButtonPressed))
      v_container.addGestureRecognizer(tapgr_container)
    }
    
    if viewModel.displayedList.tapGesture {
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapGestureRecognized))
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
    
    if !flag_hideFooter {
      let count = CGFloat(viewModel.displayedList.viewModel.displayedRows.count)
      let offset = count > 0 ? -1 : 15
      let scale = 0.8
      collection.snp.makeConstraints { [weak self] in
        guard let _s = self else { return }
        $0.top.equalTo(v_header.snp.bottom).offset(offset)
        $0.right.equalToSuperview().offset(-20)
        $0.left.equalToSuperview().offset(20)
//        $0.height.lessThanOrEqualToSuperview().multipliedBy(scale)
        if count > 0 {
          let con_max = (UIScreen.main.bounds.size.height * (CGFloat(scale) - 0.2))
          let h_sum = con_max * count
          if h_sum <= con_max {
            $0.height.equalTo(h_sum)
          } else {
            $0.height.equalTo(con_max)
          }
        } else {
          $0.height.equalTo(_s.collection.snp.width)
        }
      }
      
      v_footer.snp.makeConstraints {
        $0.top.equalTo(collection.snp.bottom).offset(offset)
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview()
        $0.left.equalToSuperview()
        $0.height.equalTo(45)
      }
    } else {
      collection.snp.makeConstraints {
        $0.top.equalTo(v_header.snp.bottom).offset(15)
        $0.right.equalToSuperview().offset(-20)
        $0.bottom.equalToSuperview().offset(-15)
        $0.left.equalToSuperview().offset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.5)
      }
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    let vm_header = PopupHeaderViewUC.ViewModel()
    vm_header.displayedHeader = viewModel.displayedHeader
    let vm_footer = PopupFooterViewUC.ViewModel()
    vm_footer.displayedFooter = viewModel.displayedFooter
    v_header.setupData(with: vm_header)
    v_footer.setupData(with: vm_footer)
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      _s.adpater!.setupData(with: _s.viewModel.displayedList.viewModel)
    }
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
  
  
  
  //MARK: - VIP - UseCase
  
  
  
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
    okButtonPressed()
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
