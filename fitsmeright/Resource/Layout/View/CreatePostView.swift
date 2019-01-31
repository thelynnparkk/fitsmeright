//
//  CreatePostView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



class CreatePostViewUC {
  
  class DisplayedCreatePost {
    var img_clothListSelected: [UIImage] = []
    var img_background: UIImage?
  }
  
  class DisplayedPost {
    var img_post: UIImage?
  }
  
  class ViewModel: AGViewModel {
    var isMerged = false
    var displayedCreatePost = DisplayedCreatePost()
    var displayedPost = DisplayedPost()
  }
  
}



extension CreatePostView:
  AGViewInstantiatable
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class CreatePostView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var imgv_01: UIImageView!
  @IBOutlet weak var imgv_02: UIImageView!
  @IBOutlet weak var imgv_03: UIImageView!
  @IBOutlet weak var imgv_04: UIImageView!
  @IBOutlet weak var imgv_background: UIImageView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = CreatePostViewUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    loadContainerIntoView()
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
    loadContainerIntoView()
    super.awakeFromNib()
    
  }
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    view.backgroundColor = c.lightGray.withAlphaComponent(0.2)
    imgv_01.contentMode = .scaleAspectFit
    imgv_02.contentMode = .scaleAspectFit
    imgv_03.contentMode = .scaleAspectFit
    imgv_04.contentMode = .scaleAspectFit
    imgv_background.contentMode = .scaleAspectFit
    
    
    
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
    switch vm.isMerged {
    case true:
      imgv_01.isHidden = true
      imgv_02.isHidden = true
      imgv_03.isHidden = true
      imgv_04.isHidden = true
      if let img = vm.displayedPost.img_post {
        imgv_background.image = img
      }
    case false:
      for img in vm.displayedCreatePost.img_clothListSelected.enumerated() {
        switch img.offset {
        case 0:
          imgv_01.image = img.element
        case 1:
          imgv_02.image = img.element
        case 2:
          imgv_03.image = img.element
        case 3:
          imgv_04.image = img.element
        default:
          return
        }
      }
      if let img = vm.displayedCreatePost.img_background {
        imgv_background.image = img
      }
    }
    
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


