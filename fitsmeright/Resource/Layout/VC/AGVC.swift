//
//  AGVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import SwifterSwift



class AGVCUC {
  
  class Setup {
    class DisplayedSetup {
      
    }
    class ViewModel {
      var displayedSetup = DisplayedSetup()
    }
  }
  
}



protocol AGVCDelegate: class {
  func agVCPressed(_ vc: AGVC, action: Any)
}



extension AGVC:
  Preparable
{
  
}



class AGVC: UIViewController {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var vc_panelVC: PanelVC?
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var delegate_agvc: AGVCDelegate?
  
  
  
  //MARK: - Flag
  var isPanelListVisible = false
  
  
  
  //MARK: - Storage
  var displayedSetup = AGVCUC.Setup.DisplayedSetup()
  
  
  
  //MARK: - Apperance
  var statusBarStyle: UIStatusBarStyle = .lightContent
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return statusBarStyle
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupInit()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  deinit {
    setupDeinit()
  }
  
  func setupInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  func setupPrepare() {
    
  }
  
  func setupDeinit() {
  }
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
  }
  
  
  
  //MARK: - SetupView
  func setupViewByOrientation() {
    
  }
  
  
  
  //MARK: - SetupData
  func setupData(with viewModel: AGVCUC.Setup.ViewModel) {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
