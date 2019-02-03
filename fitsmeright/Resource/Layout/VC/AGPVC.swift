//
//  AGPVC.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 3/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension AGPVC
{
  
}



class AGPVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - UI
  var vc_panelListVC: PanelListVC!
  var isPanelListVisible = false
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func prepare() {
    super.prepare()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  func addPanelVC() {
    isPanelListVisible = true
    addChild(vc_panelListVC)
    view.addSubview(vc_panelListVC.view)
    vc_panelListVC.didMove(toParent: self)
    let height = view.frame.height
    let width  = view.frame.width
    vc_panelListVC.view.frame = CGRect(x: 0, y: view.frame.maxY , width: width, height: height)
    vc_panelListVC.view.addShadow(ofColor: .black, radius: 5, offset: .less, opacity: 0.3)
  }
  
  func removePanelVC() {
    isPanelListVisible = false
    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options: UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    var frame = self.vc_panelListVC.view.frame
                    frame.origin.y = UIScreen.main.bounds.maxY
                    self.vc_panelListVC.view.frame = frame
                    
    }, completion: { _ in
      self.vc_panelListVC.view.removeFromSuperview()
      self.vc_panelListVC.removeFromParent()
    })
  }
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}






