//
//  StateView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



class StateViewModel {
  
  class Setting {
    var img_icon: UIImage?
    var title: String?
    var description: String?
    var isIndicatorHidden: Bool = true
    var tint: UIColor?
    var img_background: UIImage?
    var font: UIFont?
  }
  
  class DisplayedState {
    var hidden = Setting()
    var loading = Setting()
    var noResults = Setting()
    var noConnection = Setting()
    var error = Setting()
  }
  
  class ViewModel {
    var displayedStates = DisplayedState()
  }
  
}



//protocol StateViewDelegate: AGViewDelegate {
//  func stateViewPressed(with stateView: StateView , state: StateView.State)
//}



extension StateView
{
  
}



class StateView: AGView {
  
  //MARK: - Enum
  enum State {
    case hidden
    case loading
    case noResults
    case noConnection
    case error
  }
  
  
  
  //MARK: - UI
  var imgv_background: UIImageView!
  var v_top: UIView!
  var imgv_icon: UIImageView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_description: UILabel!
  var iv_center: NVActivityIndicatorView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
//  var delegate_stateView: StateViewDelegate? {
//    return delegate as? StateViewDelegate
//  }
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  fileprivate var state: StateView.State = .hidden
  fileprivate var displayed: StateViewModel.DisplayedState = StateView.default.displayedStates
  fileprivate var axis: NSLayoutConstraint.Axis = .vertical
  
  
  
  //MARK: - Initial
  init(viewModel: StateViewModel.ViewModel, axis: NSLayoutConstraint.Axis) {
    self.displayed = viewModel.displayedStates
    self.axis = axis
    super.init(frame: .zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepare() {
    super.prepare()
    imgv_background.image = nil
    iv_center.isHidden = true
    imgv_icon.image = nil
    lb_title.text = ""
    lb_description.text = ""
    alpha = 0
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
    //MARK: Core
    backgroundColor = .clear
    
    
    
    //MARK: Component
    imgv_background = UIImageView()
    imgv_background.backgroundColor = UIColor.clear
    imgv_background.contentMode = .scaleAspectFill
    imgv_background.isUserInteractionEnabled = true
    
    v_top = UIView()
    v_top.backgroundColor = UIColor.clear
    
    imgv_icon = UIImageView()
    imgv_icon.backgroundColor = UIColor.clear
    imgv_icon.contentMode = .scaleAspectFit
    
    stv_info = UIStackView()
    stv_info.backgroundColor = UIColor.clear
    stv_info.axis = .vertical
    stv_info.alignment = .fill
    stv_info.distribution = .fill
    stv_info.spacing = 10
    
    lb_title = UILabel()
    lb_title.text = "title"
    lb_title.textColor = UIColor.darkText
    lb_title.backgroundColor = UIColor.clear
    lb_title.numberOfLines = 0
    lb_title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    
    lb_description = UILabel()
    lb_description.text = "description"
    lb_description.textColor = UIColor.darkText
    lb_description.backgroundColor = UIColor.clear
    lb_description.numberOfLines = 0
    lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    iv_center = NVActivityIndicatorView(frame: .zero, type: .ballScaleMultiple, color: UIColor.white, padding: nil)
    iv_center.startAnimating()
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stateViewPressed(_:)))
    tapGesture.cancelsTouchesInView = false
    addGestureRecognizer(tapGesture)
    
    switch axis {
    case .vertical:
      lb_title.textAlignment = .center
      lb_description.textAlignment = .center
    case .horizontal:
      lb_title.textAlignment = .left
      lb_description.textAlignment = .left
    }
    
    addSubview(imgv_background)
    addSubview(v_top)
    v_top.addSubview(imgv_icon)
    addSubview(stv_info)
    addSubview(iv_center)
    
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_description)
    
    prepare()
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    lb_title.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    lb_description.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    
    imgv_background.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    
    switch axis {
    case .vertical:
      v_top.snp.makeConstraints {
        $0.top.right.left.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.5)
      }
      imgv_icon.snp.makeConstraints {
        $0.bottom.equalToSuperview()
        $0.centerX.equalToSuperview()
        //        $0.height.equalToSuperview().multipliedBy(0.7)
        $0.height.equalToSuperview().multipliedBy(0.3)
        $0.width.equalTo(imgv_icon.snp.height)
      }
      iv_center.snp.makeConstraints {
        $0.bottom.equalTo(imgv_icon.snp.bottom)
        $0.centerX.equalTo(imgv_icon.snp.centerX)
        $0.width.equalToSuperview().multipliedBy(0.3)
        $0.height.equalTo(iv_center.snp.width)
      }
      stv_info.snp.makeConstraints {
        $0.top.equalTo(v_top.snp.bottom).offset(20)
        $0.bottom.lessThanOrEqualToSuperview().inset(20)
        $0.width.equalToSuperview().multipliedBy(0.8)
        $0.centerX.equalToSuperview()
      }
    case .horizontal:
      v_top.snp.makeConstraints {
        $0.top.bottom.left.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.4)
      }
      imgv_icon.snp.makeConstraints {
        $0.right.equalToSuperview()
        $0.centerY.equalToSuperview()
        //        $0.width.equalToSuperview().multipliedBy(0.6)
        $0.width.equalToSuperview().multipliedBy(0.3)
        $0.height.equalTo(imgv_icon.snp.width)
      }
      iv_center.snp.makeConstraints {
        $0.right.equalToSuperview()
        $0.centerY.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.1)
        $0.height.equalTo(iv_center.snp.width)
      }
      stv_info.snp.makeConstraints {
        $0.left.equalTo(v_top.snp.right).offset(20)
        $0.right.equalToSuperview().inset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.6)
        $0.centerY.equalToSuperview()
      }
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
  }
  
  override func setupViewOnAwakeFromNib() {
    setupViewOnInit()
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    setupData()
  }
  
  
  
  
  
  //MARK: - Event
  @objc func stateViewPressed(_ sender: UITapGestureRecognizer) {
    delegate?.agViewPressed(self, action: state, tag: 0)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  public func setState(with state: StateView.State, isAnimation: Bool = true, onComplete: CBVoid? = nil) {
    let duration = isAnimation ? 0.3 : 0.0
    self.state = state
    switch state {
    case .hidden:
      fadeOut(duration: duration) { [weak self] bool in
        guard let _s = self else { return }
        _s.setupData()
        onComplete?()
      }
    default:
      setupData()
      fadeIn(duration: duration) { bool in
        onComplete?()
      }
    }
  }
  
  
  
  //MARK: - Private
  private func setupData() {
    let setting: StateViewModel.Setting
    switch state {
    case .hidden:
      setting = displayed.hidden
    case .loading:
      setting = displayed.loading
    case .noResults:
      setting = displayed.noResults
    case .noConnection:
      setting = displayed.noConnection
    case .error:
      setting = displayed.error
    }
    
    let tint = setting.tint ?? UIColor.black
    if let img = setting.img_background {
      imgv_background.image = img
    } else {
      imgv_background.image = nil
    }
    
    iv_center.isHidden = setting.isIndicatorHidden
    iv_center.color = tint
    if !setting.isIndicatorHidden {
      iv_center.startAnimating()
    }
    
    if let img = setting.img_icon {
      imgv_icon.image = img
    } else {
      imgv_icon.image = nil
    }
    
    lb_title.text = setting.title
    lb_description.text = setting.description
    lb_title.textColor = tint
    lb_description.textColor = tint
    
    if let font = setting.font {
      lb_title.font = font
      lb_description.font = font
    } else {
      lb_title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
}


