//
//  AGCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class AGCCDisplayed {
  var isAnimated: Bool = false
  var isEnabled: Bool = true
}



protocol AGCCDelegate: class {
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath)
}



extension AGCC:
  Preparable
{
  
}



class AGCC: UICollectionViewCell {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGCCDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var displayedCC = AGCCDisplayed()
  var indexPath: IndexPath = IndexPath(row: 0, section: 0)
  
  
  
  //MARK: - Apperance
  override var isHighlighted: Bool {
    didSet {
      isHighlighted ? setupViewOnStateChange(.highlighted) : setupViewOnStateChange(.normal)
    }
  }
  
  override var isSelected: Bool {
    didSet {
      isSelected ? setupViewOnStateChange(.selected) : setupViewOnStateChange(.normal)
    }
  }
  
  override var isUserInteractionEnabled: Bool {
    didSet {
      isUserInteractionEnabled ? setupViewOnStateChange(.normal) : setupViewOnStateChange(.disabled)
    }
  }
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    setupDeinit()
  }
  
  //MARK: - Initial
  func setupInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  func setupPrepare() {
    
  }
  
  func setupDeinit() {
    
  }
  
  
  
  
  //MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  
  
  //MARK: - SetupView
  func setupViewOnStateChange(_ state: UIControl.State) {
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
  func setupData(with displayed: AGCCDisplayed?) {
    
  }
  
  func displaySetupData(with displayed: AGCCDisplayed?, onPresented: @escaping CBVoid) {
    DispatchQueue.main.async {
      if let displayed = displayed, displayed.isAnimated {
        UIView.animate(withDuration: 0.3) {
          onPresented()
        }
      } else {
        onPresented()
      }
    }
  }
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
