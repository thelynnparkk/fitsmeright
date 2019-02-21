//
//  ClosetFormView.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ClosetFormViewDisplayed: AGViewDisplayed {
  var key: String?
  var value: String?
  var placeHolder: String?
  var isEditable: Bool = true
}



extension ClosetFormView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class ClosetFormView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var lb_key: UILabel!
  @IBOutlet weak var txt_value: UITextField!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = ClosetFormViewDisplayed
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func setupInit() {
    Bundle.main.loadNibNamed(String(describing: ClosetFormView.self), owner: self, options: nil)
    addSubview(view)
    view.fillToSuperview()
    super.setupInit()
    //MARK: Core
    backgroundColor = .clear
    
    
    
    //MARK: Component
    view.backgroundColor = .white
    v_seperator.backgroundColor = c_material.grey300
    lb_key.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    txt_value.textColor = c_material.grey500
    txt_value.textAlignment = .right
    txt_value.borderStyle = .none
    txt_value.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  //MARK: - Life cycle

  
  
  //MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGViewDisplayed?) {
    guard let displayed = displayed as? Displayed else { return }
    setupViewFrame()
    lb_key.text = displayed.key
    txt_value.text = displayed.value
    txt_value.placeholder = displayed.placeHolder
    txt_value.isUserInteractionEnabled = displayed.isEditable
    txt_value.borderStyle = displayed.isEditable ? .roundedRect : .none
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

