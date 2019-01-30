//
//  ClosetFormView.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ClosetFormViewUC {
  
  class DisplayedForm {
    var key: String?
    var value: String?
    var placeHolder: String?
    var isEditable: Bool = true
  }
  
  class ViewModel: AGViewModel {
    var displayedForm = DisplayedForm()
  }
  
}



extension ClosetFormView:
  AGViewInstantiatable
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
  typealias ViewModel = ClosetFormViewUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    loadContainerIntoView()
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
    loadContainerIntoView()
    super.awakeFromNib()
    
  }
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
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
    
    
    
  }
  
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    backgroundColor = .clear
    
    
    
    //MARK: Component
    view.backgroundColor = .white
    v_seperator.backgroundColor = c_material.grey300
    lb_key.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    txt_value.textAlignment = .right
    txt_value.borderStyle = .none
    txt_value.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupData(with viewModel: AGViewModel) {
    guard let vm = viewModel as? ViewModel else { return }
    setupViewFrame()
    lb_key.text = vm.displayedForm.key
    txt_value.text = vm.displayedForm.value
    txt_value.placeholder = vm.displayedForm.placeHolder
    txt_value.isUserInteractionEnabled = vm.displayedForm.isEditable
    txt_value.borderStyle = vm.displayedForm.isEditable ? .roundedRect : .none
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

