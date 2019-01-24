//
//  FloatingView.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class FloatingViewModel: AGViewModel {
  var image: UIImage?
}



extension FloatingView:
  AGViewInstantiatable
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class FloatingView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var imgv_icon: UIImageView!
  var tapGesture: UITapGestureRecognizer!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Model = FloatingViewModel
  
  
  
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
    setupViewFrame()
    backgroundColor = .clear
    addShadow(ofColor: .black, radius: frame.midY, offset: .less, opacity: 0.1)
    layer.masksToBounds = true
    clipsToBounds = false
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(gesture)
    
    
    
    //MARK: Component
    v_container.backgroundColor = c_custom.peach
    v_container.layer.cornerRadius = v_container.frame.midY
    v_container.clipsToBounds = true
    imgv_icon.contentMode = .scaleAspectFit
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    

  }
  
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    setupViewFrame()
    backgroundColor = .clear
    addShadow(ofColor: .black, radius: frame.midY, offset: .less, opacity: 0.1)
    layer.masksToBounds = true
    clipsToBounds = false
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(gesture)
    
    
    
    //MARK: Component
    v_container.backgroundColor = c_custom.peach
    v_container.layer.cornerRadius = v_container.frame.midY
    v_container.clipsToBounds = true
    imgv_icon.contentMode = .scaleAspectFit
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    

  }
  
  override func setupViewOnLayoutSubviews() {
    addShadow(ofColor: .black, radius: frame.midY, offset: .less, opacity: 0.1)
    v_container.layer.cornerRadius = v_container.frame.midY
  }

  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupData(with data: AGViewModel) {
    guard let d = data as? Model else { return }
    imgv_icon.image = d.image
  }
  
  
  
  //MARK: - Event
  @objc func viewTapped(_ sender: UITapGestureRecognizer) {
    delegate?.agViewPressed(self)
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}

