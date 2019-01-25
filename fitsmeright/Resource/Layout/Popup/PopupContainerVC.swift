//
//  PopupContainerVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import SnapKit
import PopupDialog



class PopupContainerVCUC {
  
  class DisplayedContainer {
    var injectedView = UIView()
    var tapDismissal = true
  }
  
  class ViewModel: PopupVCModel {
    var displayedHeader = PopupHeaderViewUC.DisplayedHeader()
    var displayedFooter = PopupFooterViewUC.DisplayedFooter()
    var displayedContainer = DisplayedContainer()
  }
  
}



extension PopupContainerVC:
  AGViewDelegate
{
  
}



class PopupContainerVC: PopupVC {
  //MARK: - AGInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var v_container: UIView!
  var tapgr_container: UIGestureRecognizer!
  var v_header: PopupHeaderView!
  var v_seperator: UIView!
  var stv_container: UIStackView!
  var v_footer: PopupFooterView!
  
  
  
  //MARK: - LayoutConstraint
  var con_containerStackViewTop: Constraint!
  var con_containerStackViewBottom: Constraint!
  
  
  
  //MARK: - Constraint
  typealias ViewModel = PopupContainerVCUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var flag_hideFooter = false
  
  
  
  //MARK: - Storage
  var viewModel: PopupContainerVCUC.ViewModel = PopupContainerVCUC.ViewModel()
  
  
  
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
    
    v_seperator = UIView()
    v_seperator.backgroundColor = c_material.grey200
    
    stv_container = UIStackView()
    stv_container.backgroundColor = .clear
    stv_container.axis = .vertical
    stv_container.alignment = .fill
    stv_container.distribution = .fill
    stv_container.spacing = 0
    
    v_footer = PopupFooterView()
    v_footer.backgroundColor = .clear
    v_footer.delegate = self
    
    view.addSubview(v_container)
    v_container.addSubview(v_header)
    v_container.addSubview(v_seperator)
    v_container.addSubview(stv_container)
//    stv_container.addArrangedSubview(displayed.injectedView)
    
    if !flag_hideFooter {
      v_container.addSubview(v_footer)
    } else {
      tapgr_container = UITapGestureRecognizer(target: self, action: #selector(okButtonPressed))
      v_container.addGestureRecognizer(tapgr_container)
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
    
    v_seperator.snp.makeConstraints {
      $0.top.equalTo(v_header.snp.bottom)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    if !flag_hideFooter {
      stv_container.snp.makeConstraints {
        con_containerStackViewTop = $0.top.equalTo(v_seperator.snp.bottom).offset(15).constraint
        $0.right.equalToSuperview().offset(-20)
        $0.left.equalToSuperview().offset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.5)
      }
      
      v_footer.snp.makeConstraints {
        con_containerStackViewBottom = $0.top.equalTo(stv_container.snp.bottom).offset(15).constraint
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview()
        $0.left.equalToSuperview()
        $0.height.equalTo(45)
      }
    } else {
      stv_container.snp.makeConstraints {
        con_containerStackViewTop = $0.top.equalTo(v_seperator.snp.bottom).offset(15).constraint
        $0.right.equalToSuperview().offset(-20)
        con_containerStackViewBottom = $0.bottom.equalToSuperview().offset(-15).constraint
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
    stv_container.addArrangedSubview(viewModel.displayedContainer.injectedView)
    v_footer.setupData(with: vm_footer)
  }
  
  override func setupData(with viewModel: PopupVCModel) {
    guard let vm = viewModel as? ViewModel else { return }
    self.viewModel = vm
  }
  
  
  
  //MARK: - Event
  
  
  
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
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
