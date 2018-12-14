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



class CreatePostView: UIView {
  
  //MARK: - UI
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
  
  
  
  //MARK: - Life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViewOnAwakeFromNib()
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnAwakeFromNib() {
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


