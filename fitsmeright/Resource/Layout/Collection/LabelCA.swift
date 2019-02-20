//
//  LabelCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 4/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class LabelCADisplayed: AGCADisplayed {
  
}



extension LabelCA:
  UICollectionViewDataSource,
  UICollectionViewDelegate,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate
{
  
  
}



class LabelCA: AGCA {
  
  //MARK: - Enum
  
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = LabelCADisplayed
  typealias CC = LabelCC
  var displayedCALabel: Displayed? {
    return displayedCA as? Displayed
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  override var height: CGFloat {
    let rows = displayedCA.sections.map({ $0.items.count }).reduce(0, +).cgFloat
    let label_items = CC.Sizing.size(with: collection.bounds).height * rows
    let label_spaces = (CC.Sizing.lineSpace() * (rows - 1))
    let label_insets = (CC.Sizing.inset().top + CC.Sizing.inset().bottom)
    let label = label_items + label_spaces + label_insets
    return label
  }
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    collection.setupCollectionDefault()
    collection.setupScrollVertical()
    collection.register(nibWithCellClass: CC.self)
    collection.delegate = self
    collection.dataSource = self
    collection.backgroundColor = .clear
    collection.allowsSelection = true
    collection.contentInsetAdjustmentBehavior = .always
    collection.isPrefetchingEnabled = true
    
    let layout = UICollectionViewFlowLayout()
    collection.collectionViewLayout = layout
    
    
    
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
  
  
  
  //MARK: - LifeCycle
  
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGCADisplayed?) {
    if let displayed = displayed as? Displayed {
      displayedCA = displayed
      collection.isUserInteractionEnabled = true
      collection.collectionViewLayout.invalidateLayout()
      collection.reloadData()
    } else {
      
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  
  //MARK: - Core - UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard !isSectionEmpty() else {
      return 0
    }
    return displayedCA.sections[section].items.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return UICollectionViewCell()
    }
    let cell = collectionView.dequeueReusableCell(withClass: CC.self, for: indexPath)
    let item = displayedCALabel?.sections[indexPath.section].items[indexPath.row] as? CC.Displayed
    cell.indexPath = indexPath
    cell.delegate = self
    item?.isAnimated = false
    cell.setupData(with: item)
    return cell
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    let cell = cell as? CC
    let item = displayedCALabel?.sections[indexPath.section].items[indexPath.row] as? CC.Displayed
    item?.isAnimated = false
    item?.isLastRow = collectionView.indexPathForLastItem == indexPath
    cell?.setupData(with: item)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    delegate?.agCAPressed(self, action: [], indexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    collectionView.cellForItem(at: indexPath)?.isHighlighted = true
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    collectionView.cellForItem(at: indexPath)?.isHighlighted = false
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CC.Sizing.size(with: collectionView.bounds)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return CC.Sizing.inset()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CC.Sizing.lineSpace()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return CC.Sizing.itemSpace()
  }
  
  
  
  //MARK: - Custom - AGCCDelegate
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
