//
//  PopupHeaderView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import SnapKit



class PopupHeaderViewDisplayed: AGViewDisplayed {
  var style: PopupHeaderView.Style = .small
  var imageURL: URL? = nil
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
    case small
    case large
  }
  
  class Sizing {
    
    static func height(style: Style) -> CGFloat {
      switch style {
      case .small:
        return 100
      case .large:
        return 240
      }
    }
    
    static func inset(style: Style) -> CGFloat {
      switch style {
      case .small:
        return 25
      case .large:
        return 30
      }
    }
    
    static func imageViewHeight(style: Style) -> CGFloat {
      switch style {
      case .small:
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
  var v_seperator: UIView!
  
  
  
  //MARK: - NSLayout
  var con_headerStackViewTop: Constraint!
  var con_headerImageViewHeight: Constraint!
  
  
  
  //MARK: - Constraint
  typealias Displayed = PopupHeaderViewDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    backgroundColor = .white
    
    
    
    //MARK: Component
    stv_header = UIStackView()
    stv_header.backgroundColor = .clear
    stv_header.axis = .horizontal
    stv_header.alignment = .fill
    stv_header.distribution = .fill
    stv_header.spacing = 15
    
    imgv_header = UIImageView()
    imgv_header.image = nil
    imgv_header.contentMode = .scaleAspectFit
    imgv_header.backgroundColor = .white
    imgv_header.clipsToBounds = true
    imgv_header.kf.indicatorType = .activity
    
    stv_info = UIStackView()
    stv_info.backgroundColor = .clear
    stv_info.axis = .vertical
    stv_info.alignment = .fill
    stv_info.distribution = .fillProportionally
    stv_info.spacing = 0
    
    lb_title = UILabel()
    lb_title.text = ""
    //    lb_title.setupTitleDark()
    lb_title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    
    lb_subtitle = UILabel()
    lb_subtitle.text = ""
    lb_subtitle.numberOfLines = 0
    lb_subtitle.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    lb_subtitle.textColor = c_material.grey500
    //    lb_subtitle.setupSubtitleDark()
    
    v_seperator = UIView()
    v_seperator.backgroundColor = c_material.grey200
    
    addSubview(stv_header)
    stv_header.addArrangedSubview(imgv_header)
    stv_header.addArrangedSubview(stv_info)
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_subtitle)
    addSubview(v_seperator)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    lb_title.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    lb_subtitle.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    
    stv_header.snp.makeConstraints {
      con_headerStackViewTop = $0.top.equalToSuperview().constraint
      $0.right.equalToSuperview().offset(-20)
      $0.left.equalToSuperview().offset(20)
    }
    
    imgv_header.snp.makeConstraints {
      con_headerImageViewHeight = $0.height.equalTo(0).constraint
      $0.width.equalTo(imgv_header.snp.height)
    }
    
    v_seperator.snp.makeConstraints { [weak self] in
      guard let _s = self else { return }
      $0.top.equalTo(_s.stv_header.snp.bottom).offset(20)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    lb_title.snp.makeConstraints {
      $0.height.lessThanOrEqualTo(20)
    }
    
    //    lb_subtitle.snp.makeConstraints {
    //      $0.height.equalTo(25)
    //    }
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: -  LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGViewDisplayed?) {
    if let displayed = displayed as? Displayed {
      displayedView = displayed
      if let imageURL = displayed.imageURL {
        imgv_header.kf.setImage(with: imageURL, placeholder: nil, options: nil)
      } else if let icon = displayed.icon, icon != .none {
        imgv_header.image = icon
        imgv_header.backgroundColor = .clear
      } else {
        imgv_header.isHidden = true
      }
      lb_title.textColor = displayed.tint
      lb_title.text = displayed.title
      lb_subtitle.text = displayed.subtitle
      switch displayed.style {
      case .small:
        stv_header.axis = .horizontal
        stv_header.alignment = .fill
        stv_info.alignment = .leading
      case .large:
        stv_header.axis = .vertical
        stv_header.alignment = .center
        stv_info.alignment = .center
        lb_subtitle.textAlignment = .center
      }
      con_headerStackViewTop.update(offset: Sizing.inset(style: displayed.style))
      con_headerImageViewHeight.update(offset: Sizing.imageViewHeight(style: displayed.style))
    } else {
      
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


