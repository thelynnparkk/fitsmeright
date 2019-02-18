//
//  AGCRV.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class AGCRVModel {
  
}



protocol AGCRVDelegate: class {
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int)
}



extension AGCRV:
  LifeCyclable,
  Colorable
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
  var kind: String = ""
  var section: Int = 0
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  func onInit() {
    
  }
  
  func prepare() {
    
  }
  
  func prepareToDeinit() {
    
  }
  
  func onDeinit() {
    
  }
  
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
  
  
  
  //MARK: - Setup Data
  func setupDataOnAwakeFromNib() {
    
  }
  
  func setupDataOnPrepareForReuse() {
    
  }
  
  func setupData(with viewModel: AGCRVModel) {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
