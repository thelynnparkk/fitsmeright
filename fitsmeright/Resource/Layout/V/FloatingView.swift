//
//  FloatingView.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



protocol FloatingViewDelegate: class {
  func floatingViewPressed(_ view: UIView)
}



extension FloatingView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class FloatingView: UIView {
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_icon: UIImageView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: FloatingViewDelegate?
  
  
  
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
    Bundle.main.loadNibNamed("FloatingView", owner: self, options: nil)
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
    //MARK: Core
    setupViewFrame()
    backgroundColor = .clear
    addShadow(ofColor: .black, radius: frame.midY, offset: .less, opacity: 0.1)
    layer.masksToBounds = true
    clipsToBounds = false
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(gesture)
    
    
    
    //MARK: UI
    v_container.backgroundColor = UIColor.Custom.peach
    v_container.layer.cornerRadius = v_container.frame.midY
    v_container.clipsToBounds = true
    imgv_icon.contentMode = .scaleAspectFit
    
    
    
    //MARK: Misc
    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setup(image: UIImage) {
    imgv_icon.image = image
  }
  
  
  
  //MARK: - Event
  @objc func viewTapped(_ sender: UITapGestureRecognizer) {
    delegate?.floatingViewPressed(self)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

