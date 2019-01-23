//
//  ImageCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ImageCCModel: AGCCModel {
  var imageUrl: URL?
}



extension ImageCC
{
  
}



class ImageCC: AGCC {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Model = ImageCCModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
  override func onInit() {
    
  }
  
  override func prepare() {
    
  }
  
  override func prepareToDeinit() {
    
  }
  
  override func onDeinit() {
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  override func setupViewOnPrepareForReuse() {
    
  }
  
  
  
  //MARK: - SetupData
  override func setupDataOnAwakeFromNib() {
    
  }
  
  override func setupDataOnPrepareForReuse() {
    
  }
  
  override func setupData(with data: AGCCModel) {
    guard let _ = data as? Model else { return }
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
