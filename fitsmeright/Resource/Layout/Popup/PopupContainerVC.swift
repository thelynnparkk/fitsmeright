//
//  PopupContainerVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import SnapKit
import PopupDialog



class PopupContainerVCUC {
  
  class Setup {
    class DisplayedSetupPopupContainer: PopupVCUC.Setup.DisplayedSetupPopup {
      var injectedView: UIView?
      var injectedViewHeight: CGFloat?
    }
    
    class ViewModel: PopupVCUC.Setup.ViewModel {
      
    }
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
  var v_header: PopupHeaderView!
  var stv_container: UIStackView!
  var v_footer: PopupFooterView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - LayoutConstraint
  var con_containerStackViewTop: Constraint!
  var con_containerStackViewBottom: Constraint!
  
  
  
  //MARK: - Constraint
  typealias UC = PopupContainerVCUC
  var displayedPopupContainer: UC.Setup.DisplayedSetupPopupContainer? {
    return displayedSetup as? UC.Setup.DisplayedSetupPopupContainer
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
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
    
    stv_container = UIStackView()
    stv_container.backgroundColor = .clear
    stv_container.axis = .vertical
    stv_container.alignment = .fill
    stv_container.distribution = .fillProportionally
    stv_container.spacing = 0
    
    v_footer = PopupFooterView()
    v_footer.backgroundColor = .clear
    v_footer.delegate = self
    
    view.addSubview(v_container)
    v_container.addSubview(v_header)
    v_container.addSubview(stv_container)
    if let v = displayedPopupContainer!.injectedView {
      stv_container.addArrangedSubview(v)
    }
    
    if displayedPopupContainer!.isHideFooter {
      
    } else {
      v_container.addSubview(v_footer)
    }
    
    if displayedPopupContainer!.isTapContainerEnabled {
      tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
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
      $0.height.lessThanOrEqualTo(PopupHeaderView.Sizing.height(style: displayedPopupContainer!.displayedHeader.style))
    }
    
    if displayedPopupContainer!.isHideFooter {
      stv_container.snp.makeConstraints {
        $0.top.equalTo(v_header.snp.bottom).offset(15)
        $0.right.equalToSuperview().offset(-20)
        $0.bottom.equalToSuperview().offset(-15)
        $0.left.equalToSuperview().offset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.5)
      }
    } else {
      let offset = displayedPopupContainer!.injectedView == nil ? -1 : 15
      stv_container.snp.makeConstraints {
        $0.top.equalTo(v_header.snp.bottom).offset(offset)
        $0.right.equalToSuperview().offset(-20)
        $0.left.equalToSuperview().offset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.8)
      }
      
      v_footer.snp.makeConstraints {
        $0.top.equalTo(stv_container.snp.bottom).offset(offset)
        $0.right.equalToSuperview()
        $0.bottom.equalToSuperview()
        $0.left.equalToSuperview()
        $0.height.equalTo(45)
      }
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    v_header.setupData(with: displayedPopupContainer!.displayedHeader)
    v_footer.setupData(with: displayedPopupContainer!.displayedFooter)
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with viewModel: AGVCUC.Setup.ViewModel) {
    guard let vm = viewModel as? UC.Setup.ViewModel else { return }
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
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
    case is PopupFooterView:
      if let action = action as? PopupFooterView.Action {
        switch action {
        case .cancel:
          cancelButtonPressed()
        case .ok:
          okButtonPressed()
        }
      }
    default:
      break
    }
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
