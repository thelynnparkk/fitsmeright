//
//  LabelCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class LabelCCUC {
  
  enum Style {
    case normal
    case disable
    case negative
    case positive
  }
  
  class DisplayedLabel {
    var title: String = ""
    var subtitle: String?
    var weight: UIFont.Weight = .regular
    var style: Style = .normal
  }
  
  class ViewModel: AGCCModel {
    var displayedLabel = DisplayedLabel()
  }
  
}



extension LabelCC
{
  
}



class LabelCC: AGCC {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace)
      let insets = inset(custom: customInset).right + inset(custom: customInset).left
      let side = (bound.width - spaces - insets)
      return CGSize(width: side, height: 60)
    }
    
    static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 0
    }
    
    static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 5
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 5)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_subtitle: UILabel!
  
  @IBOutlet weak var v_seperator: UIView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = LabelCCUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
  override func onInit() {
    
  }
  
  override func prepare() {
    
  }
  
  override func prepareToDeinit() {
    
  }
  
  override func onDeinit() {
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    
    
    
    //MARK: Component
    lb_title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    lb_title.textColor = c_material.grey500
    lb_subtitle.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    lb_subtitle.textColor = c_material.grey400
    v_seperator.backgroundColor = c_material.grey200
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  override func setupViewOnPrepareForReuse() {
    
  }
  
  
  
  //MARK: - SetupData
  override func setupDataOnAwakeFromNib() {
    
  }
  
  override func setupDataOnPrepareForReuse() {
    
  }
  
  override func setupData(with viewModel: AGCCModel) {
    guard let vm = viewModel as? ViewModel else { return }
    lb_title.text = vm.displayedLabel.title
    lb_subtitle.text = vm.displayedLabel.subtitle
    lb_title.font = UIFont.systemFont(ofSize: 14, weight: vm.displayedLabel.weight)
    lb_subtitle.font = UIFont.systemFont(ofSize: 11, weight: vm.displayedLabel.weight)
    switch vm.displayedLabel.style {
    case .normal:
      lb_title.textColor = c_material.grey500
      lb_subtitle.textColor = c_material.grey400
      backgroundColor = .white
    case .disable:
      isUserInteractionEnabled = false
      lb_title.textColor = .white
      lb_subtitle.textColor = .white
      backgroundColor = c_material.grey300
    case .negative:
      lb_title.textColor = c_material.red
      lb_subtitle.textColor = c_material.grey300
      backgroundColor = c_material.grey300
    case .positive:
      lb_title.textColor = c_custom.peach
      lb_subtitle.textColor = c_material.grey300
      backgroundColor = c_material.grey300
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
