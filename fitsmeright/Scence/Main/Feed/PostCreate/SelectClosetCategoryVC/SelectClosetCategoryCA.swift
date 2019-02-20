//
//  SelectClosetCategoryCA.swift
//  fitsmeright
//
//  Created by Lynn Park on 19/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class SelectClosetCategoryCADisplayed: AGCADisplayed {

}



extension SelectClosetCategoryCA:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate,
  AGCRVDelegate
{


}



class SelectClosetCategoryCA: AGCA {

  //MARK: - Enum




  //MARK: - UI



  //MARK: - NSLayout



  //MARK: - Constraint
  typealias Displayed = SelectClosetCategoryCADisplayed
  typealias CC = IconLabelCC
  var displayedCASelectClosetCategory: Displayed? {
    return displayedCA as? Displayed
  }



  //MARK: - Instance



  //MARK: - Flag



  //MARK: - Storage



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
    setupLocalize()
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }



  //MARK: - Setup View
  


  //MARK: - Setup Data
  override func setupData(with displayed: AGCADisplayed?) {
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      _s.collection.reloadData()
      if let displayed = displayed as? Displayed {
        _s.displayedCA = displayed
        _s.collection.isUserInteractionEnabled = true
        _s.collection.collectionViewLayout.invalidateLayout()
        _s.collection.refreshControl?.endRefreshing()
      } else {
        
      }
    }
  }



  //MARK: - Event



  //MARK: - Public
  override func setupLocalize() {

  }



  //MARK: - Private



  //MARK: - Core - UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return displayedCA.sections.count
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard !isSectionEmpty() else {
      return 0
    }
    return displayedCA.sections[section].items.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard !isSectionEmpty() else {
      return UICollectionViewCell()
    }
    let cell = collectionView.dequeueReusableCell(withClass: CC.self, for: indexPath)
    let item = displayedCASelectClosetCategory?.sections[indexPath.section].items[indexPath.row] as? CC.Displayed
    cell.indexPath = indexPath
    cell.delegate = self
    item?.isAnimated = false
    cell.setupData(with: item)
    return cell
  }



  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    collectionView.deselectItem(at: indexPath, animated: true)
    delegate?.agCAPressed(self, action: [], indexPath: indexPath)
  }

  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
  //    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  //  }



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



  //MARK: - Custom - AGCRVDelegate
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int) {

  }



  //MARK: - Pod - Protocol



}

