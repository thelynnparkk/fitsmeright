//
//  AGCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class AGCADisplayed {
  class Section {
    var header: AGCRVDisplayed?
    var footer: AGCRVDisplayed?
    var items: [AGCCDisplayed] = []
  }
  var sections: [Section] = []
}



protocol AGCADelegate: class {
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath)
}



extension AGCA:
  Preparable,
  Colorable
{
  
}



class AGCA: NSObject {
  
  //MARK: - Enum
  enum Action {
    case none
  }
  
  
  
  //MARK: - UI
  private(set) weak var collection: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGCADelegate?
  
  
  
  //MARK: - Flag
  var height: CGFloat {
    return 0.0
  }
  
  
  
  //MARK: - Storage
  var displayedCA = AGCADisplayed()
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  required public init(collection: UICollectionView) {
    super.init()
    self.collection = collection
    setupInit()
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
  
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  func setupData(with viewModel: AGCADisplayed?) {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  func isSectionEmpty() -> Bool {
    return displayedCA.sections.isEmpty
  }
  
  func isRowInSectionEmpty(with indexPath: IndexPath) -> Bool {
    return displayedCA.sections[indexPath.section].items.isEmpty
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
