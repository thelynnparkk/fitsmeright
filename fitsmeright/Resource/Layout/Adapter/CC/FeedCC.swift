//
//  FeedCC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class FeedCCDisplayed: AGCCDisplayed {
  var outfitImageURL: URL?
  var userImageURL: URL?
  var displayName: String?
  var username: String?
  var isLiked: Bool = false
  var like: String?
  var comment: String?
}



extension FeedCC
{
  
}



class FeedCC: AGCC {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace)
      let insets = inset(custom: customInset).left + inset(custom: customInset).right
      let side = (bound.width - spaces - insets)
      let constraints = 20 + 35 + 20
      return CGSize(width: side, height: side + constraints.cgFloat)
    }
    
    static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 0
    }
    
    static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 10
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 30)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  enum Action {
    case tap
    case doubleTap
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv: UIImageView!
  @IBOutlet weak var imgv_user: UIImageView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_subtitle: UILabel!
  @IBOutlet weak var imgv_like: UIImageView!
  @IBOutlet weak var lb_likes: UILabel!
  @IBOutlet weak var imgv_comment: UIImageView!
  @IBOutlet weak var lb_comments: UILabel!
  var tapGesture: UITapGestureRecognizer!
  var doubleTapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = FeedCCDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    v_container.layer.cornerRadius = 20
    v_container.clipsToBounds = true
    imgv.contentMode = .scaleAspectFill
    imgv.clipsToBounds = true
    imgv.kf.indicatorType = .activity
    setupViewFrame()
    imgv_user.contentMode = .scaleAspectFill
    imgv_user.clipsToBounds = true
    imgv_user.kf.indicatorType = .activity
    imgv_user.layer.cornerRadius = imgv_user.bounds.width
    lb_title.font = UIFont(name: f_system.helveticaBold, size: f_size.h6)
    lb_title.textColor = c_material.grey800
    lb_subtitle.font = UIFont(name: f_system.helvetica, size: f_size.h6)
    lb_subtitle.textColor = c_custom.peach
    imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: c_material.grey400)
    lb_likes.font = UIFont(name: f_system.helvetica, size: f_size.h6)
    lb_likes.textColor = c_material.grey400
    imgv_comment.image = #imageLiteral(resourceName: "ic_comment").filled(withColor: c_material.grey400)
    lb_comments.font = UIFont(name: f_system.helvetica, size: f_size.h6)
    lb_comments.textColor = c_material.grey400
    
    doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
    doubleTapGesture.numberOfTapsRequired = 2
    
    tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized))
    tapGesture.delaysTouchesBegan = true
    tapGesture.require(toFail: doubleTapGesture)
    
    addGestureRecognizer(doubleTapGesture)
    addGestureRecognizer(tapGesture)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
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
  
  override func setupViewOnStateChange(_ state: UIControl.State) {
    switch state {
    case .normal:
      break
    case .highlighted:
      break
    case .disabled:
      break
    case .selected:
      break
    default:
      break
    }
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
  
  override func setupData(with displayed: AGCCDisplayed?) {
    func present() {
//      @IBOutlet weak var v_container: UIView!
//      @IBOutlet weak var imgv: UIImageView!
//      @IBOutlet weak var imgv_user: UIImageView!
//      @IBOutlet weak var lb_title: UILabel!
//      @IBOutlet weak var lb_subtitle: UILabel!
//      @IBOutlet weak var imgv_like: UIImageView!
//      @IBOutlet weak var lb_likes: UILabel!
//      @IBOutlet weak var imgv_comment: UIImageView!
//      @IBOutlet weak var lb_comments: UILabel!
      if let displayed = displayed as? Displayed {
        self.displayedCC = displayed
        if let imageURL = displayed.outfitImageURL {
          imgv.kf.setImage(with: imageURL)
        } else {
          imgv.image = #imageLiteral(resourceName: "ic_add_shoes")
        }
        if let imageURL = displayed.userImageURL {
          imgv_user.kf.setImage(with: imageURL)
        } else {
          imgv_user.image = #imageLiteral(resourceName: "ic_add_shoes")
        }
        imgv.alpha = 1
        imgv_user.alpha = 1
        lb_title.text = displayed.displayName
        lb_subtitle.text = displayed.username
        imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: displayed.isLiked ? c_custom.peach : c_material.grey400)
        lb_likes.text = displayed.like
        lb_comments.text = displayed.comment
      } else {
        imgv.image = #imageLiteral(resourceName: "ic_add_shoes")
        imgv.alpha = 0
        imgv_user.image = #imageLiteral(resourceName: "ic_add_shoes")
        imgv_user.alpha = 1
        lb_title.text = ""
        lb_subtitle.text = ""
        imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: c_material.grey400)
        lb_likes.text = "0"
        lb_comments.text = "0"
      }
      setupViewFrame()
      addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    }
    present()
  }
  
  
  
  //MARK: - Event
  @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
    switch sender {
    case tapGesture:
      delegate?.agCCPressed(self, action: Action.tap, indexPath: indexPath)
    case doubleTapGesture:
      if let displayed = displayedCC as? Displayed {
        displayed.isLiked = !displayed.isLiked
        if displayed.isLiked {
          displayed.like = "\((displayed.like?.int ?? 0) + 1)"
        } else {
          displayed.like = "\((displayed.like?.int ?? 0) - 1)"
        }
        lb_likes.text = displayed.like
        imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: displayed.isLiked ? c_custom.peach : c_material.grey400)
        delegate?.agCCPressed(self, action: Action.doubleTap, indexPath: indexPath)
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
