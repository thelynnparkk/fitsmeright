//
//  CreatePostView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreatePostView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class CreatePostView: UIView {
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_01: UIImageView!
  @IBOutlet weak var imgv_02: UIImageView!
  @IBOutlet weak var imgv_03: UIImageView!
  @IBOutlet weak var imgv_04: UIImageView!
  @IBOutlet weak var imgv_background: UIImageView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  override init(frame: CGRect) {
    super.init(frame: frame)
    onInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
  }
  
  
  
  //MARK: - Life cycle
  func onInit() {
    Bundle.main.loadNibNamed("CreatePostView", owner: self, options: nil)
    v_container.match(in: self)
    setupViewOnInit()
  }
  
  func onDeinit() {
    
  }
  
  
  //MARK: - Setup View
  func setupViewOnInit() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    imgv_01.contentMode = .scaleAspectFit
    imgv_02.contentMode = .scaleAspectFit
    imgv_03.contentMode = .scaleAspectFit
    imgv_04.contentMode = .scaleAspectFit
    imgv_background.contentMode = .scaleAspectFit
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


