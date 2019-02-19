//
//  AGCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class AGCAModel {
  class Section {
    var header: AGCRVModel?
    var footer: AGCRVModel?
    var items: [AGCCModel] = []
  }
  var section: [Section] = []
}



protocol AGCADelegate: class {
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath)
}



extension AGCA:
  LifeCyclable,
  Colorable
{
  
}



open class AGCA: NSObject {

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
  var viewModel: AGCAModel = AGCAModel()
  
  
  
  //MARK: - Initial
  
  
  required public init(collection: UICollectionView) {
    super.init()
    self.collection = collection
    onInit()
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  func onInit() {
    setupViewOnInit()
    setupDataOnInit()
  }
  
  func prepare() {
    
  }
  
  func prepareToDeinit() {
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnInit() {
    
  }
  
  func setupData(with viewModel: AGCAModel) {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  func setupLocalize() {
    
  }
  
  func isSectionEmpty() -> Bool {
    return viewModel.section.isEmpty
  }
  
  func isRowInSectionEmpty(with indexPath: IndexPath) -> Bool {
    return viewModel.section[indexPath.section].items.isEmpty
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
