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
    backgroundColor = .clear
    
    
    
    //MARK: UI
    v_container.backgroundColor = .clear
    v_overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    txt_main.text = ""
    txt_main.placeholder = "text"
    txt_main.textAlignment = .center
    
    v_overlay.isHidden = true
    txt_main.isHidden = true
    
    //MARK: Misc
    
    
   
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupTextData(text: String) {
    txt_main.text = text
    txt_main.isHidden = false
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
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


