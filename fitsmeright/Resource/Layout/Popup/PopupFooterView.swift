//
//  PopupFooterView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class PopupFooterViewModel: AGViewModel {
  var title_cancel: String? = "Cancel"
  var title_ok: String? = "Ok"
  var flag_hideCancel: Bool = false
}



protocol PopupFooterViewDelegate: class {
  func popupFooterViewDidCancel()
  func popupFooterViewDidDone()
}



extension PopupFooterView
{
  
}



class PopupFooterView: AGView {
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var stv_button: UIStackView!
  var btn_cancel: UIButton!
  var btn_ok: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Model = PopupFooterViewModel
  
  
  
  //MARK: - Instance
  weak var delegate_popupFooterView: PopupFooterViewDelegate?
  
  
  
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
    btn_cancel.setupDark()
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
  
  override func setupData(with data: AGViewModel) {
    guard let d = data as? Model else { return }
    btn_cancel.setTitle(d.title_cancel, for: .normal)
    btn_ok.setTitle(d.title_ok, for: .normal)
    btn_cancel.isHidden = d.flag_hideCancel
  }
  
  
  
  //MARK: - Event
  @objc func cancelButtonPressed(_ sender: UIButton) {
    delegate_popupFooterView?.popupFooterViewDidCancel()
  }
  
  @objc func okButtonPressed(_ sender: UIButton) {
    delegate_popupFooterView?.popupFooterViewDidDone()
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


