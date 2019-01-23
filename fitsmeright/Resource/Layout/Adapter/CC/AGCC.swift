//
//  AGCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class AGCCModel {
  
}




protocol AGCCDelegate: class {
  func agCCPressed(_ cell: UICollectionViewCell, action: Any, indexPath: IndexPath)
}



extension AGCC:
  AGCellInstantiatable,
  LifeCyclable,
  Colorable
{
  
}



open class AGCC: UICollectionViewCell {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGCCDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  public var indexPath: IndexPath = IndexPath(row: 0, section: 0)
  
  
  
  //MARK: - Initial
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
  func onInit() {
    
  }
  
  func prepare() {
    
  }
  
  func prepareToDeinit() {
    
  }
  
  func onDeinit() {
    
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    setupViewOnAwakeFromNib()
    setupDataOnAwakeFromNib()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    setupViewOnLayoutSubviews()
  }
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    setupViewOnPrepareForReuse()
    setupDataOnPrepareForReuse()
  }
  
  
  
  //MARK: - SetupView
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
  
  
  
  //MARK: - SetupData
  func setupDataOnAwakeFromNib() {
    
  }
  
  func setupDataOnPrepareForReuse() {
    
  }
  
  func setupData(with data: AGCCModel) {
    
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
