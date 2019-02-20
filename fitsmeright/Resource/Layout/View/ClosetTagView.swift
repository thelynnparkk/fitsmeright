//
//  ClosetTagView.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ClosetTagViewDisplayed: AGViewDisplayed {
  var title: String?
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
  @IBOutlet weak var lb_title: UILabel!
  var tapGesture: UITapGestureRecognizer!
  
  
  
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
    clipsToBounds = false
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(gesture)
    
    
    
    //MARK: Component
    view.backgroundColor = .white
    view.layer.cornerRadius = 8
    view.clipsToBounds = true
    lb_title.textColor = UIColor.Custom.peach
    
    
    
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
    lb_title.text = displayed.title
    setupViewFrame()
    addShadow(ofColor: .black, radius: 8, offset: .less, opacity: 0.3)
  }
  
  
  
  //MARK: - Event
  @objc func viewTapped(_ sender: UITapGestureRecognizer) {
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
