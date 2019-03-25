//
//  PostHeaderCC.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class PostHeaderCCDisplayed: AGCCDisplayed {
  var outfitImageURL: URL?
  var userImageURL: URL?
  var displayName: String?
  var username: String?
  var isLiked: Bool = false
  var like: String?
  var caption: String?
  var postClostList: [PostCloset] = []
}



extension PostHeaderCC
{
  
}



class PostHeaderCC: AGCC {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace)
      let insets = inset(custom: customInset).left + inset(custom: customInset).right
      let side = (bound.width - spaces - insets)
      let constraints = 20 + 35 + 20 + 50 + 20
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
      return 0
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(inset: 0)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  enum Action {
    case doubleTap
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var imgv: UIImageView!
  @IBOutlet weak var imgv_user: UIImageView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_subtitle: UILabel!
  @IBOutlet weak var imgv_like: UIImageView!
  @IBOutlet weak var lb_likes: UILabel!
  @IBOutlet weak var lb_caption: UILabel!
  var tapGesture: UITapGestureRecognizer!
  var doubleTapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = PostHeaderCCDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  var isClosetHidden = true
  
  
  
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
    v_container.clipsToBounds = true
    v_seperator.backgroundColor = c_material.grey200
    imgv.contentMode = .scaleAspectFill
    imgv.clipsToBounds = true
    imgv.kf.indicatorType = .activity
    setupViewFrame()
    imgv_user.contentMode = .scaleAspectFill
    imgv_user.clipsToBounds = true
    imgv_user.kf.indicatorType = .activity
    imgv_user.layer.cornerRadius = imgv_user.bounds.width / 2
    lb_title.font = UIFont(name: f_system.helveticaBold, size: f_size.h6)
    lb_title.textColor = c_material.grey800
    lb_subtitle.font = UIFont(name: f_system.helvetica, size: f_size.h6)
    lb_subtitle.textColor = c_custom.peach
    imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: c_material.grey400)
    lb_likes.font = UIFont(name: f_system.helvetica, size: f_size.h6)
    lb_likes.textColor = c_material.grey400
    
    lb_caption.font = UIFont(name: f_system.helvetica, size: f_size.h3)
    lb_caption.textColor = c_material.grey800
    
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
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGCCDisplayed?) {
    func present() {
      setupViewFrame()
      imgv_user.layer.cornerRadius = imgv_user.bounds.width / 2
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
        lb_caption.text = displayed.caption
        imgv.removeSubviews()
        isClosetHidden = true
        for i in displayed.postClostList {
          let view = ClosetTagView()
          let x = (imgv.frame.width * i._fsPostCloset._locationPercentX.cgFloat)
          let y = (imgv.frame.height * i._fsPostCloset._locationPercentY.cgFloat)
          view.frame = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(side: 40))
          view.alpha = 0
          let displayed = ClosetTagViewDisplayed()
          displayed.icon = i._fsCloset.closetCategory.icon.filled(withColor: .white)
          view.setupData(with: displayed)
          imgv.addSubview(view)
        }
      } else {
        imgv.image = #imageLiteral(resourceName: "ic_add_shoes")
        imgv.alpha = 0
        imgv_user.image = #imageLiteral(resourceName: "ic_add_shoes")
        imgv_user.alpha = 1
        lb_title.text = ""
        lb_subtitle.text = ""
        imgv_like.image = #imageLiteral(resourceName: "ic_like").filled(withColor: c_material.grey400)
        lb_likes.text = "0"
        lb_caption.text = ""
      }
    }
    present()
  }
  
  
  
  //MARK: - Event
  @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
    switch sender {
    case tapGesture:
      isClosetHidden = !isClosetHidden
      for i in imgv.subviews {
        UIView.animate(withDuration: 0.2) {
          i.alpha = self.isClosetHidden ? 0 : 1
        }
      }
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
