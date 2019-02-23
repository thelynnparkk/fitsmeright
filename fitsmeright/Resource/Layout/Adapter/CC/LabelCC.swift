//
//  LabelCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class LabelCCDisplayed: AGCCDisplayed {
  var title: String = ""
  var subtitle: String?
  var weight: UIFont.Weight = .regular
  var style: LabelCC.Style = .normal
  var isLastRow: Bool = false
}



extension LabelCC
{
  
}



class LabelCC: AGCC {
  
  //MARK: - Enum
  enum Sizing: Sizeable {
    
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
      return 0
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 0)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  enum Style {
    case normal
    case negative
    case positive
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_subtitle: UILabel!
  
  @IBOutlet weak var v_seperator: UIView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = LabelCCDisplayed
  var displayedCCLabel: Displayed? {
    return displayedCC as? Displayed
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
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
  override func awakeFromNib() {
    super.awakeFromNib()
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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupData(with: Displayed())
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnStateChange(_ state: UIControl.State) {
    if let displayed = displayedCCLabel {
      setupViewLabelStyle(with: displayed.style)
    }
    switch state {
    case .normal:
      break
    case .highlighted:
      v_container.backgroundColor = c_material.grey100
    case .disabled:
      lb_title.textColor = .white
      lb_subtitle.textColor = .white
      v_container.backgroundColor = c_material.grey300
    case .selected:
      v_container.backgroundColor = c_material.grey100
    default:
      break
    }
  }

  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGCCDisplayed?) {
    func present() {
      if let displayed = displayed as? Displayed {
        self.displayedCC = displayed
        lb_title.text = displayed.title
        lb_subtitle.text = displayed.subtitle
        lb_title.font = UIFont.systemFont(ofSize: 14, weight: displayed.weight)
        lb_subtitle.font = UIFont.systemFont(ofSize: 11, weight: displayed.weight)
        isUserInteractionEnabled = displayed.isEnabled
        v_seperator.isHidden = displayed.isLastRow
      } else {
        lb_title.text = ""
        lb_subtitle.text = ""
      }
    }
    displaySetupData(with: displayed, onPresented: present)
  }
  
  func setupViewLabelStyle(with style: Style) {
    switch style {
    case .normal:
      lb_title.textColor = c_material.grey500
      lb_subtitle.textColor = c_material.grey400
      v_container.backgroundColor = .white
    case .negative:
      lb_title.textColor = c_material.red
      lb_subtitle.textColor = c_material.grey300
      v_container.backgroundColor = .white
    case .positive:
      lb_title.textColor = .red
      lb_subtitle.textColor = c_material.grey300
      v_container.backgroundColor = .white
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
