//
//  CreateTextView.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension CreateTextView
{
  
}



/*
 Note: Creating a Custom View with xib.
 Source: https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5
 */
class CreateTextView: UIView {
  
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
    Bundle.main.loadNibNamed("CreateTextView", owner: self, options: nil)
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
    isHidden = true
    backgroundColor = .clear
    
    
    
    //MARK: UI
    v_container.backgroundColor = .clear
    v_overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    txt_main.text = ""
    txt_main.placeholder = "text"
    
    
    
    //MARK: Misc
    
    
   
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func startEdit() {
    txt_main.becomeFirstResponder()
  }
  
  func endEdit() {
    txt_main.resignFirstResponder()
  }
  
  
  func displayStartEdit(onComplete: @escaping CBVoid) {
    isHidden = false
    v_container.alpha = 0
    UIView.animate(withDuration: 0.3, animations: {
      self.v_container.alpha = 1
    }) { _ in
      onComplete()
    }
  }
  
  func displayStopEdit(onComplete: @escaping CBVoid) {
    isHidden = true
    v_container.alpha = 1
    UIView.animate(withDuration: 0.3, animations: {
      self.v_container.alpha = 0
    }) { _ in
      onComplete()
    }
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


