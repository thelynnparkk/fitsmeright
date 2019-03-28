//
//  FriendRequestCC.swift
//  fitsmeright
//
//  Created by Lynn Park on 28/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class FriendRequestCCDisplayed: AGCCDisplayed {
  var title: String?
  var description: String?
  var icon: UIImage?
  var imageURL: URL?
}



extension FriendRequestCC
{
  
}



class FriendRequestCC: AGCC {
  
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
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_icon: UIImageView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_description: UILabel!
  @IBOutlet weak var btn_yes: UIButton!
  @IBOutlet weak var btn_no: UIButton!
  @IBOutlet weak var v_seperator: UIView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = FriendRequestCCDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
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
    lb_title.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    lb_title.textColor = .black
    lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    lb_description.textColor = .black
    imgv_icon.contentMode = .scaleAspectFit
    imgv_icon.clipsToBounds = true
    imgv_icon.kf.indicatorType = .activity
    btn_yes.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    btn_no.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    v_seperator.backgroundColor = c_material.grey200
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnStateChange(_ state: UIControl.State) {
    switch state {
    case .normal:
      break
    case .highlighted:
      break
    case .disabled:
      break
    case .selected:
      break
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
        lb_description.text = displayed.description
        if let imageURL = displayed.imageURL {
          imgv_icon.kf.setImage(with: imageURL)
        } else {
          imgv_icon.image = displayed.icon
        }
      } else {
        
      }
    }
    present()
  }
  
  func roundedIcon() {
    setupViewFrame()
    imgv_icon.clipsToBounds = true
    imgv_icon.cornerRadius = imgv_icon.frame.width / 2
  }
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    delegate?.agCCPressed(self, action: sender == btn_yes, indexPath: indexPath)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
