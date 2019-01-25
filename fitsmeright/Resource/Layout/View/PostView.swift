//
//  PostView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit
import SwiftDate



class PostViewUC {
  
  class DisplayedPost {
    
  }
  
  class ViewModel: AGViewModel {
    var displayedPost = MockPost()
  }
  
}



extension PostView:
  AGViewInstantiatable
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class PostView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
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
  typealias ViewModel = PostViewUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    loadContainerIntoNib()
    super.onInit()
  }
  
  override func prepare() {
    super.prepare()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  override func awakeFromNib() {
    loadContainerIntoNib()
    super.awakeFromNib()
    
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
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnAwakeFromNib() {
    setupViewOnInit()
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupData(with viewModel: AGViewModel) {
    guard let vm = viewModel as? ViewModel else { return }
    //    let bkk = Region(calendar: Calendars.buddhist, zone: Zones.asiaBangkok, locale: Locales.thai)
    //    let date = post._string_createdAt.toDate("yyyy-MM-dd HH:mm", region: bkk)
    //    let date = post._string_createdAt.toFormat("dd MMM", locale: .thai)
    lb_username.text = "lin-ping"
    lb_createdAt.text = vm.displayedPost._string_createdAt
    lb_caption.text = vm.displayedPost.string_captionSelected
    v_createPost.setupClothData(images: vm.displayedPost.img_clothSelected)
    v_createPost.setupBackgroundData(image: vm.displayedPost._img_backgroundSelected)
    v_createText.setupTextData(text: vm.displayedPost._string_textSelected)
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


