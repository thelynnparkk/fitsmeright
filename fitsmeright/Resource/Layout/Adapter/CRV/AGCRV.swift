//
//  AGCRV.swift
//  fitsmeright
//
//  Created by Lynn Park on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class AGCRVDisplayed {
  var kind: String = ""
  var isHidden: Bool = false
}



protocol AGCRVDelegate: class {
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int)
}



extension AGCRV:
  Preparable
{
  
}



class AGCRV: UICollectionReusableView {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGCRVDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var displayedCRV = AGCRVDisplayed()
  var kind: String = ""
  var section: Int = 0
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
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
    setupViewOnAwakeFromNib()
    setupDataOnAwakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupViewOnLayoutSubviews()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupViewOnPrepareForReuse()
    setupDataOnPrepareForReuse()
  }
  
  
  
  func setupViewOnAwakeFromNib() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
  }
  
  func setupViewOnLayoutSubviews() {
    
  }
  
  func setupViewOnPrepareForReuse() {
    
  }
  
  
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - SetupData
  func setupDataOnAwakeFromNib() {
    
  }
  
  func setupDataOnPrepareForReuse() {
    
  }
  
  func setupData(with displayed: AGCRVDisplayed) {
    
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
