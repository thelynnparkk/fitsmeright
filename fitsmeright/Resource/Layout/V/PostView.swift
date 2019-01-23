//
//  PostView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SwiftDate



extension PostView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class PostView: AGView {
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_user: UIImageView!
  @IBOutlet weak var lb_username: UILabel!
  @IBOutlet weak var lb_createdAt: UILabel!
  @IBOutlet weak var lb_caption: UILabel!
  @IBOutlet weak var btn_option: UIButton!
  @IBOutlet weak var v_createPost: CreatePostView!
  @IBOutlet weak var v_createText: CreateTextView!
  @IBOutlet weak var lb_like: UILabel!
  @IBOutlet weak var lb_comment: UILabel!
  @IBOutlet weak var btn_like: UIButton!
  @IBOutlet weak var btn_message: UIButton!
  @IBOutlet weak var btn_share: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    Bundle.main.loadNibNamed("PostView", owner: self, options: nil)
    v_container.match(in: self)
    super.onInit()
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    v_createPost.isUserInteractionEnabled = false
    v_createText.isUserInteractionEnabled = false
    
    btn_option.addTarget(self, action: #selector(optionButtonPressed), for: .touchUpInside)
    btn_like.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
    btn_message.addTarget(self, action: #selector(messageButtonPressed), for: .touchUpInside)
    btn_share.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  func setupPostData(post: MockPost) {
//    let bkk = Region(calendar: Calendars.buddhist, zone: Zones.asiaBangkok, locale: Locales.thai)
//    let date = post._string_createdAt.toDate("yyyy-MM-dd HH:mm", region: bkk)
//    let date = post._string_createdAt.toFormat("dd MMM", locale: .thai)
    lb_username.text = "lin-ping"
    lb_createdAt.text = post._string_createdAt
    lb_caption.text = post.string_captionSelected
    v_createPost.setupClothData(images: post.img_clothSelected)
    v_createPost.setupBackgroundData(image: post._img_backgroundSelected)
    v_createText.setupTextData(text: post._string_textSelected)
  }
  
  
  
  //MARK: - Event
  @objc
  func optionButtonPressed(_ sender: UIButton) {
    
  }
  
  @objc
  func likeButtonPressed(_ sender: UIButton) {
    
  }
  
  @objc
  func messageButtonPressed(_ sender: UIButton) {
    
  }
  
  @objc
  func shareButtonPressed(_ sender: UIButton) {
    
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


