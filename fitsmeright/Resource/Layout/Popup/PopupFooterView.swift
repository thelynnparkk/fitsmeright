//
//  PopupFooterView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class PopupFooterViewUC {
  
  class DisplayedFooter {
    var title_cancel: String? = "Cancel"
    var title_ok: String? = "Ok"
    var flag_hideCancel: Bool = false
  }
  
  class ViewModel: AGViewModel {
    var displayedFooter = DisplayedFooter()
  }
  
  
}



extension PopupFooterView
{
  
}



class PopupFooterView: AGView {
  //MARK: - Enum
  enum Action {
    case cancel
    case ok
  }
  
  
  
  //MARK: - UI
  var stv_button: UIStackView!
  var btn_cancel: UIButton!
  var btn_ok: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = PopupFooterViewUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: -  Life Cycle
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
  
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
    //MARK: Core
    backgroundColor = .white
    
    
    
    //MARK: Component
    stv_button = UIStackView()
    stv_button.backgroundColor = .clear
    stv_button.axis = .horizontal
    stv_button.alignment = .fill
    stv_button.distribution = .fillEqually
    stv_button.spacing = 0
    
    btn_cancel = UIButton(type: .custom)
    btn_cancel.setupCancelDark()
    btn_cancel.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    
    btn_ok = UIButton(type: .custom)
    btn_ok.setupDark()
    btn_ok.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
    
    addSubview(stv_button)
    stv_button.addArrangedSubview(btn_cancel)
    stv_button.addArrangedSubview(btn_ok)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    stv_button.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    //    lb_subtitle.snp.makeConstraints {
    //      $0.height.equalTo(25)
    //    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupDataOnAwakeFromNib() {
    
  }
  
  override func setupData(with viewModel: AGViewModel) {
    guard let vm = viewModel as? ViewModel else { return }
    btn_cancel.setTitle(vm.displayedFooter.title_cancel, for: .normal)
    btn_ok.setTitle(vm.displayedFooter.title_ok, for: .normal)
    btn_cancel.isHidden = vm.displayedFooter.flag_hideCancel
  }
  
  
  
  //MARK: - Event
  @objc func cancelButtonPressed(_ sender: UIButton) {
    delegate?.agViewPressed(self, action: Action.cancel, tag: 0)
  }
  
  @objc func okButtonPressed(_ sender: UIButton) {
    delegate?.agViewPressed(self, action: Action.ok, tag: 0)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


