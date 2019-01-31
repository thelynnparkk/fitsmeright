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
    var title_cancel: String? = "CANCEL"
    var title_ok: String? = "OK"
    var display: PopupFooterView.Display = .both
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
  enum Display {
    case cancel
    case ok
    case both
  }
  
  
  
  //MARK: - UI
  var v_seperator: UIView!
  var stv_button: UIStackView!
  var btn_cancel: UIButton!
  var v_seperatorButton: UIView!
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
    v_seperator = UIView()
    v_seperator.backgroundColor = c_material.grey200
    
    stv_button = UIStackView()
    stv_button.backgroundColor = .clear
    stv_button.axis = .horizontal
    stv_button.alignment = .fill
    stv_button.distribution = .fillEqually
    stv_button.spacing = 1
    
    btn_cancel = UIButton(type: .custom)
    btn_cancel.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_cancel.setupCancelDark()
    btn_cancel.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    
    v_seperatorButton = UIView()
    v_seperatorButton.backgroundColor = c_material.grey200
    
    btn_ok = UIButton(type: .custom)
    btn_ok.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_ok.setupOkDark()
    btn_ok.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
    
    addSubview(v_seperator)
    addSubview(stv_button)
    addSubview(v_seperatorButton)
    stv_button.addArrangedSubview(btn_cancel)
    stv_button.addArrangedSubview(btn_ok)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_seperator.snp.makeConstraints { 
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    stv_button.snp.makeConstraints { [weak self] in
      guard let _s = self else { return }
      $0.top.equalTo(_s.v_seperator.snp.bottom)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    v_seperatorButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.equalTo(1)
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
    
    switch vm.displayedFooter.display {
    case .cancel:
      btn_cancel.isHidden = true
      v_seperatorButton.isHidden = true
    case .ok:
      btn_ok.isHidden = true
      v_seperatorButton.isHidden = true
    case .both:
      break
    }
    
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



