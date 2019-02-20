//
//  AGView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class AGViewDisplayed {
  
}



protocol AGViewDelegate: class {
  func agViewPressed(_ view: AGView, action: Any, tag: Int)
}



extension AGView:
  Preparable
{
  
}



class AGView: UIView {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var displayedView = AGViewDisplayed()
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupInit()
  }
  
  deinit {
    setupDeinit()
  }
  
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
  
  
  
  //MARK: - SetupView
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - SetupData
  func setupData(with displayed: AGViewDisplayed?) {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

