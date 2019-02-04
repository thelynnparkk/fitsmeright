//
//  ProfileCC.swift
//  fitsmeright
//
//  Created by Lynn Park on 26/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ProfileCCUC {
  
  class DisplayedProfile {
    var imageURL: URL?
    var displayName: String = ""
    var bio: String = ""
    var posts: String = ""
    var friends: String = ""
    var closets: String = ""
  }
  
  class ViewModel: AGCCModel {
    var displayedProfile = DisplayedProfile()
  }
  
}



extension ProfileCC
{
  
}



class ProfileCC: AGCC {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero) -> CGSize {
      let rowSpace = CGFloat(1)
      let side = (bound.width - (itemSpace() * rowSpace) - (inset().right + inset().left))
      return CGSize(width: side, height: 180)
    }
    
    static func itemSpace(with bound: CGRect = .zero) -> CGFloat {
      return 0
    }
    
    static func lineSpace(with bound: CGRect = .zero) -> CGFloat {
      return 0
    }
    
    static func inset(with bound: CGRect = .zero) -> UIEdgeInsets {
      return .zero
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_profile: UIImageView!
  @IBOutlet weak var lb_displayName: UILabel!
  @IBOutlet weak var lb_bio: UILabel!
  @IBOutlet weak var v_seperatorTop: UIView!
  @IBOutlet weak var v_seperatorBottom: UIView!
  @IBOutlet weak var lb_postsKey: UILabel!
  @IBOutlet weak var lb_friendsKey: UILabel!
  @IBOutlet weak var lb_closetsKey: UILabel!
  @IBOutlet weak var lb_postsValue: UILabel!
  @IBOutlet weak var lb_friendsValue: UILabel!
  @IBOutlet weak var lb_closetsValue: UILabel!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = ProfileCCUC.ViewModel
  
  
  
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
    imgv_profile.backgroundColor = c_material.grey400
    lb_displayName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    lb_bio.textColor = c_material.grey500
    v_seperatorTop.backgroundColor = c_material.grey300
    v_seperatorBottom.backgroundColor = c_material.grey300
    lb_postsKey.textColor = c_material.grey500
    lb_postsKey.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    lb_friendsKey.textColor = c_material.grey500
    lb_friendsKey.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    lb_closetsKey.textColor = c_material.grey500
    lb_closetsKey.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    lb_postsValue.textColor = c_material.grey700
    lb_postsValue.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    lb_friendsValue.textColor = c_material.grey700
    lb_friendsValue.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    lb_closetsValue.textColor = c_material.grey700
    lb_closetsValue.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    
    
    
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
  
  override func setupData(with viewModel: AGCCModel) {
    guard let vm = viewModel as? ViewModel else { return }
    if let imageURL = vm.displayedProfile.imageURL {
      imgv_profile.kf.setImage(with: imageURL, placeholder: nil, options: nil)
    } else {
      imgv_profile.image = nil
    }
    lb_displayName.text = vm.displayedProfile.displayName
    lb_bio.text = vm.displayedProfile.bio
    lb_postsValue.text = vm.displayedProfile.posts
    lb_friendsValue.text = vm.displayedProfile.friends
    lb_closetsValue.text = vm.displayedProfile.closets
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