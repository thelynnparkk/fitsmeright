//
//  ImageCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class ImageCCDisplayed: AGCCDisplayed {
  var imageURL: URL?
}



extension ImageCC
{
  
}



class ImageCC: AGCC {
  
  //MARK: - Enum
  enum Sizing: Sizeable {
    
    static func size(with bound: CGRect = .zero,
                     rowItems: Int = 1,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace) * CGFloat(rowItems - 1)
      let insets = inset(custom: customInset).right + inset(custom: customInset).left
      let side = ((bound.width - spaces - insets) / CGFloat(rowItems)).rounded(.down)
      return CGSize(width: side, height: side)
    }
    
    static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 2
    }
    
    static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 2
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 2)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv: UIImageView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = ImageCCDisplayed
  var displayedCCImage: Displayed? {
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
    v_container.backgroundColor = .white
    imgv.kf.indicatorType = .activity
    
    
    
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
        displayedCC = displayed
        if let imageURL = displayed.imageURL {
          imgv.kf.setImage(with: imageURL, placeholder: nil, options: nil)
        } else {
          imgv.image = #imageLiteral(resourceName: "library_white")
        }
        imgv.alpha = 1
      } else {
        imgv.image = #imageLiteral(resourceName: "library_white")
        imgv.alpha = 0
      }
    }
    displaySetupData(with: displayed, onPresented: present)
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
