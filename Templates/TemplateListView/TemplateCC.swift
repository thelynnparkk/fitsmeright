//
//  TemplateCC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



//import UIKit
//import AugustFriday
//
//
//
////MARK: - TemplateCCM
//struct TemplateCCM: AGGenericCM {
//  var tag: Int = 0
//  var name: String = ""
//  var icon: UIImage? = nil
//  var isUserInteraction: Bool = false
//}
//
//
//
////MARK: - Extensions
//extension TemplateCC:
//  AGGenericCC,
//  AGViewFontTextStyleDependency
//{ }
//
//
//
////MARK: - TemplateCC
//class TemplateCC: AGCollectionCell {
//
//  //MARK: - Sizing
//  class SC: AGSizeClassUICollection {
//
//    static func size(with bound: CGRect = .zero) -> CGSize {
//      let size = bound.size.width.rounded(.down)
//      return CGSize(width: size ,height: 60)
//    }
//
//  }
//
//
//
//  //MARK: - UI
//  var v_container: UIView!
//  var lb_title: UILabel!
//  var v_seperator: UIView!
//  var imgv_icon: UIImageView!
//
//
//
//  //MARK: - NSLayout
//
//
//
//  //MARK: - Constraint
//
//
//
//  //MARK: - Instance
//
//
//
//  //MARK: - Flag
//
//
//
//  //MARK: - Storage
//  var sc_size: CGFloat {
//    return SC.size().height
//  }
//
//
//  //MARK: - Initial
//  convenience init() {
//    self.init(frame: .zero)
//
//  }
//
//  override init(frame: CGRect) {
//    super.init(frame: .zero)
//    onInit()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//
//  }
//
//  deinit {
//    onDeinit()
//  }
//
//
//
//  //MARK: - Life cycle
//  override func awakeFromNib() {
//    super.awakeFromNib()
//    onInit()
//  }
//
//  override func prepareForReuse() {
//    super.prepareForReuse()
//    v_seperator.isHidden = true
//  }
//
//  func onInit() {
//    setupUI()
//    setupSnp()
//  }
//
//  func onDeinit() {
//
//  }
//
//
//
//  //MARK: - Setup View
//  func setupUI() {
//    setupDefault()
//    backgroundColor = KK.Cons.Color.Theme.main_bg.normal
//    contentView.backgroundColor = KK.Cons.Color.Theme.main_bg.normal
//
//    v_container = UIView()
//    v_container.backgroundColor = KK.Cons.Color.Theme.main_bg.normal
//
//    v_seperator = UIView()
//    v_seperator.backgroundColor = KK.Cons.Color.cloud
//
//    lb_title = UILabel()
//    lb_title.text = "-"
//    lb_title.textColor = KK.Cons.Color.lead
//    lb_title.font = UIFont.boldSystemFont(ofSize: 14)
//    lb_title.backgroundColor = KK.Cons.Color.clear
//
//    imgv_icon = UIImageView()
//    imgv_icon.image = nil
//    imgv_icon.contentMode = .scaleAspectFit
//    imgv_icon.backgroundColor = KK.Cons.Color.clear
//    imgv_icon.clipsToBounds = true
//
//    contentView.addSubview(v_container)
//    v_container.addSubview(v_seperator)
//    v_container.addSubview(lb_title)
//    v_container.addSubview(imgv_icon)
//
//
//  }
//
//  func setupSnp() {
//    v_container.snp.makeConstraints {
//      $0.top.right.bottom.left.equalToSuperview()
//    }
//
//    v_seperator.snp.makeConstraints {
//      $0.right.bottom.left.equalToSuperview()
//      $0.height.equalTo(0.5)
//    }
//
//    imgv_icon.snp.makeConstraints {
//      $0.right.equalTo(lb_title.snp.left).offset(-15)
//      $0.centerY.equalToSuperview()
//      $0.height.equalTo(20)
//      $0.width.equalTo(imgv_icon.snp.height)
//    }
//
//    lb_title.snp.makeConstraints {
//      $0.center.equalToSuperview()
//    }
//
//  }
//
//
//
//  //MARK: - Setup Data
//  func setupData() {
//
//  }
//
//  func setupData(with data: AGGenericCM) {
//    if let d = data as? TemplateCCM {
//      lb_title.text = d.name
//      imgv_icon.image = d.icon?.overlay(with: KK.Cons.Color.red)
//    } else {
//
//    }
//  }
//
//
//
//  //MARK: - Event
//
//
//
//  //MARK: - Public
//
//
//
//  //MARK: - Private
//
//
//
//  //MARK: - Core - Protocol
//
//
//
//  //MARK: - Custom - Protocol
//
//
//
//  //MARK: - Pods - Protocol
//
//
//
//
//}

