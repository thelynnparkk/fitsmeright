//
//  ClosetTagView.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ClosetTagViewDisplayed: AGViewDisplayed {
  var icon: UIImage?
}



extension ClosetTagView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class ClosetTagView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var imgv: UIImageView!
  var longGesture: UILongPressGestureRecognizer!
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed =  ClosetTagViewDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  override func setupInit() {
    Bundle.main.loadNibNamed(String(describing: ClosetTagView.self), owner: self, options: nil)
    addSubview(view)
    view.fillToSuperview()
    super.setupInit()
    //MARK: Core
    backgroundColor = .clear
    layer.masksToBounds = true
    longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGestureRecognized))
    addGestureRecognizer(longGesture)
    
    
    
    //MARK: Component
    view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    view.layer.masksToBounds = true
    
    imgv.contentMode = .scaleAspectFit
    imgv.clipsToBounds = true
    
    
    
    
    
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
  
  
  
  //MARK: - Life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  override func setupData(with displayed: AGViewDisplayed?) {
    guard let displayed = displayed as? Displayed else { return }
    imgv.image = displayed.icon
    setupViewFrame()
    view.layer.cornerRadius = view.bounds.width / 2
    addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
  }
  
  
  
  //MARK: - Event
  @objc
  func longGestureRecognized(_ sender: UILongPressGestureRecognizer) {
    delegate?.agViewPressed(self, action: [], tag: tag)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
