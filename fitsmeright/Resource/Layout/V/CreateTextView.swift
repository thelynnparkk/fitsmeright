//
//  CreateTextView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreateTextView:
  AGViewInstantiatable
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class CreateTextView: AGView {
  //MARK: - AGViewInstantiatable
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var v_overlay: UIView!
  @IBOutlet weak var txt_main: UITextField!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
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
    
    
    
    //MARK: Component
    v_container.backgroundColor = .clear
    v_overlay.backgroundColor = c.black.withAlphaComponent(0.6)
    txt_main.text = ""
    txt_main.placeholder = "text"
    txt_main.textAlignment = .center
    
    v_overlay.isHidden = true
    txt_main.isHidden = true
    
    
    
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
  
  func setupTextData(text: String) {
    txt_main.text = text
    txt_main.isHidden = false
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  func startEdit() {
    txt_main.becomeFirstResponder()
  }
  
  func endEdit() {
    txt_main.resignFirstResponder()
  }
  
  
  func displayStartEdit(onComplete: @escaping CBVoid) {
    v_overlay.isHidden = false
    txt_main.isHidden = false
    v_overlay.alpha = 0
    UIView.animate(withDuration: 0.3, animations: {
      self.v_overlay.alpha = 1
    }) { _ in
      onComplete()
    }
  }
  
  func displayStopEdit(onComplete: @escaping CBVoid) {
    v_overlay.alpha = 1
    UIView.animate(withDuration: 0.3, animations: {
      self.v_overlay.alpha = 0
    }) { _ in
      self.v_overlay.isHidden = true
      self.txt_main.isHidden = (self.txt_main.text ?? "").isEmpty
      onComplete()
    }
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


