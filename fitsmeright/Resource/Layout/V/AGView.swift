//
//  AGView.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit




extension AGView:
  LifeCyclable,
  Colorable
{
  
}



class AGView: UIView {
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    onInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  func onInit() {
    setupViewOnInit()
    setupDataOnInit()
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
  
  
  
  //MARK: - Setup View
  func setupViewOnInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
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
  
  
  
  //MARK: - Setup Data
  func setupDataOnInit() {
    
  }
  
  func setupDataOnAwakeFromNib() {
    
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

