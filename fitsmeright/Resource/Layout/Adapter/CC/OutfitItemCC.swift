//
//  OutfitItemCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 20/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class OutfitItemCCDisplayed: AGCCDisplayed {
  var icon: UIImage?
  var imageURL: URL?
}



extension OutfitItemCC
{
  
}



class OutfitItemCC: AGCC {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace)
      let insets = inset(custom: customInset).top + inset(custom: customInset).bottom
      let side = (bound.height - spaces - insets)
      return CGSize(width: side, height: side)
    }
    
    static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 10
    }
    
    static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 10
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 10)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_icon: UIImageView!
  @IBOutlet weak var imgv_closet: UIImageView!
  
  
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = OutfitItemCCDisplayed
  
  
  
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
    
    v_container.layer.cornerRadius = 20
    v_container.clipsToBounds = true
    imgv_icon.contentMode = .scaleAspectFit
    imgv_closet.contentMode = .scaleAspectFill
    imgv_closet.clipsToBounds = true
    imgv_closet.kf.indicatorType = .activity
    
    
    
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
        imgv_icon.image = displayed.icon
        if let imageURL = displayed.imageURL {
          imgv_closet.kf.setImage(with: imageURL)
          imgv_closet.isHidden = false
        } else {
          imgv_closet.isHidden = true
        }
      } else {
        imgv_closet.isHidden = true
      }
      setupViewFrame()
      addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    }
    present()
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
