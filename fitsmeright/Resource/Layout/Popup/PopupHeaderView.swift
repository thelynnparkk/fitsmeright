//
//  PopupHeaderView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import SnapKit



class PopupHeaderViewModel: AGViewModel {
  var style: PopupHeaderView.Style = .default
  var url: URL? = nil
  var icon: UIImage? = nil
  var title: String = "Title"
  var subtitle: String? = nil
  var tint: UIColor = .black
}



extension PopupHeaderView
{
  
}



class PopupHeaderView: AGView {
  //MARK: - Enum
  enum Style {
    case `default`
    case large
  }
  
  class Sizing {
    
    static func height(style: Style) -> CGFloat {
      switch style {
      case .default:
        return 100
      case .large:
        return 240
      }
    }
    
    static func inset(style: Style) -> CGFloat {
      switch style {
      case .default:
        return 25
      case .large:
        return 30
      }
    }
    
    static func imageViewHeight(style: Style) -> CGFloat {
      switch style {
      case .default:
        return 50
      case .large:
        return 85
      }
    }
    
  }
  
  
  
  //MARK: - UI
  var stv_header: UIStackView!
  var imgv_header: UIImageView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_subtitle: UILabel!
  
  
  
  //MARK: - NSLayout
  var con_headerStackViewTop: Constraint!
  var con_headerImageViewHeight: Constraint!
  
  
  
  //MARK: - Constraint
  typealias Model = PopupHeaderViewModel
  
  
  
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
    stv_header = UIStackView()
    stv_header.backgroundColor = .clear
    stv_header.axis = .horizontal
    stv_header.alignment = .fill
    stv_header.distribution = .fill
    stv_header.spacing = 20
    
    imgv_header = UIImageView()
    imgv_header.image = nil
    imgv_header.contentMode = .scaleAspectFit
    imgv_header.backgroundColor = .white
    imgv_header.clipsToBounds = true
    
    stv_info = UIStackView()
    stv_info.backgroundColor = .clear
    stv_info.axis = .vertical
    stv_info.alignment = .fill
    stv_info.distribution = .fill
    stv_info.spacing = 5
    
    lb_title = UILabel()
    lb_title.text = ""
    //    lb_title.setupTitleDark()
    lb_title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    
    lb_subtitle = UILabel()
    lb_subtitle.text = ""
    lb_subtitle.numberOfLines = 0
    //    lb_subtitle.setupSubtitleDark()
    
    addSubview(stv_header)
    stv_header.addArrangedSubview(imgv_header)
    stv_header.addArrangedSubview(stv_info)
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_subtitle)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    lb_title.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    lb_subtitle.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    
    stv_header.snp.makeConstraints {
      con_headerStackViewTop = $0.top.equalToSuperview().constraint
      $0.right.equalToSuperview().offset(-20)
      $0.bottom.lessThanOrEqualToSuperview().offset(-20)
      $0.left.equalToSuperview().offset(20)
    }
    
    imgv_header.snp.makeConstraints {
      con_headerImageViewHeight = $0.height.equalTo(0).constraint
      $0.width.equalTo(imgv_header.snp.height)
    }
    
    lb_title.snp.makeConstraints {
      $0.height.equalTo(25)
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
    if let url = d.url {
      imgv_header.download(from: url, contentMode: .scaleAspectFit, placeholder: nil)
    } else if let icon = d.icon, icon != .none {
      imgv_header.image = icon
      imgv_header.backgroundColor = .clear
    } else {
      imgv_header.isHidden = true
    }
    lb_title.textColor = d.tint
    lb_title.text = d.title
    lb_subtitle.text = d.subtitle
    switch d.style {
    case .default:
      stv_header.axis = .horizontal
      stv_header.alignment = .fill
      stv_info.alignment = .leading
    case .large:
      stv_header.axis = .vertical
      stv_header.alignment = .center
      stv_info.alignment = .center
      lb_subtitle.textAlignment = .center
    }
    con_headerStackViewTop.update(offset: Sizing.inset(style: d.style))
    con_headerImageViewHeight.update(offset: Sizing.imageViewHeight(style: d.style))
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


