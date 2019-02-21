//
//  SelectClosetCategoryVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 18/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift




extension SelectClosetCategoryVC:
  AGCADelegate
{
  
}



class SelectClosetCategoryVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_close: UIBarButtonItem!
  var adapter_closetCategory: SelectClosetCategoryCA!
  @IBOutlet weak var collection_closetCategory: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
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
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = .white
    nb?.setupWith(content: .black, bg: .white, isTranslucent: false)
    
    
    
    //MARK: Component
    bbi_close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButtonPressed))
    ni.leftBarButtonItems = [bbi_close]
    adapter_closetCategory = SelectClosetCategoryCA(collection: collection_closetCategory)
    adapter_closetCategory.delegate = self
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchOutfit()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func doneButtonPressed(_ sender: UIButton) {
  
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = SelectClosetCategoryVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchOutfit
  func fetchOutfit() {
    func interactor() {
      worker()
    }
    func worker() {
      present()
    }
    func present() {
      let section = SelectClosetCategoryCADisplayed.Section()
      let closetCategorys: [ClosetCategory] = [.hat, .top, .jacket, .dress, .bottom, .sock, .shoe, .bag, .accessory]
      section.items = closetCategorys.map({
        let displayed = IconLabelCCDisplayed()
        displayed.title = $0.name
        displayed.icon =  $0.icon.filled(withColor: c_custom.peach)
        return displayed
      })
      let displayed = SelectClosetCategoryCADisplayed()
      displayed.sections = [section]
      adapter_closetCategory.setupData(with: displayed)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    let closetCategory: ClosetCategory
    switch indexPath.row {
    case 0:
      closetCategory = .hat
    case 1:
      closetCategory = .top
    case 2:
      closetCategory = .jacket
    case 3:
      closetCategory = .dress
    case 4:
      closetCategory = .bottom
    case 5:
      closetCategory = .sock
    case 6:
      closetCategory = .shoe
    case 7:
      closetCategory = .bag
    case 8:
      closetCategory = .accessory
    default:
       closetCategory = .default
    }
    delegate_agvc?.agVCPressed(self, action: closetCategory)
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

