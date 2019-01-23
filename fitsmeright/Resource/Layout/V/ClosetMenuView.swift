//
//  ClosetMenuView.swift
//  fitsmeright
//
//  Created by Lynn Park on 21/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



protocol ClosetMenuViewDelegate: class {
  func closetMenuViewPressed(_ view: UIView)
}



extension ClosetMenuView:
  AGViewInstantiatable
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class ClosetMenuView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var imgv_icon: UIImageView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: ClosetMenuViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    loadContainerIntoNib()
    super.onInit()
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
    backgroundColor = .clear
    addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    layer.masksToBounds = true
    clipsToBounds = false
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(gesture)
    
    
    
    //MARK: Component
    setupViewFrame()
    v_container.backgroundColor = .white
    v_container.layer.cornerRadius = 8
    v_container.clipsToBounds = true
    imgv_icon.contentMode = .scaleAspectFit
    lb_title.textColor = UIColor.Custom.peach
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    

  }
  
  override func setupViewOnAwakeFromNib() {
    setupViewOnInit()
  }
  
  override func setupViewOnLayoutSubviews() {
    addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.1)
    v_container.layer.cornerRadius = 8
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  func setup(title: String, image: UIImage) {
    lb_title.text = title
    imgv_icon.image = image
  }
  
  
  
  //MARK: - Event
  @objc func viewTapped(_ sender: UITapGestureRecognizer) {
    delegate?.closetMenuViewPressed(self)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
