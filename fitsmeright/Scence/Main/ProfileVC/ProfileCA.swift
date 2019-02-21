//
//  ProfileCA.swift
//  fitsmeright
//
//  Created by Lynn Park on 26/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ProfileCADisplayed: AGCADisplayed {
  
}



extension ProfileCA:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate,
  AGCRVDelegate
{
  
  
}



class ProfileCA: AGCA {
  
  //MARK: - Enum
  
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = ProfileCADisplayed
  typealias CCProfile = ProfileCC
  typealias CCImage = ImageCC
  var displayedCAProfile: Displayed? {
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
    collection.register(nibWithCellClass: CCProfile.self)
    collection.register(nibWithCellClass: CCImage.self)
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
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  override func setupData(with displayed: AGCADisplayed?) {
    if let displayed = displayed as? Displayed {
      displayedCA = displayed
    } else {
      displayedCA = Displayed()
    }
    collection.reloadData()
    collection.isUserInteractionEnabled = true
    collection.collectionViewLayout.invalidateLayout()
    collection.refreshControl?.endRefreshing()
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
    guard !isRowInSectionEmpty(with: indexPath) else {
      return UICollectionViewCell()
    }
    let item = displayedCAProfile?.sections[indexPath.section].items[indexPath.row]
    if let item = item as? CCProfile.Displayed {
      let cell = collectionView.dequeueReusableCell(withClass: CCProfile.self, for: indexPath)
      cell.indexPath = indexPath
      cell.delegate = self
      item.isAnimated = false
      cell.setupData(with: item)
      return cell
    } else if let item = item as? CCImage.Displayed {
      let cell = collectionView.dequeueReusableCell(withClass: CCImage.self, for: indexPath)
      cell.indexPath = indexPath
      cell.delegate = self
      item.isAnimated = false
      cell.setupData(with: item)
      return cell
    } else {
      return UICollectionViewCell()
    }
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    delegate?.agCAPressed(self, action: [], indexPath: indexPath)
  }
  
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
  //    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  //  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let item = displayedCAProfile?.sections[indexPath.section].items[indexPath.row]
    if let _ = item as? CCProfile.Displayed {
      return CCProfile.Sizing.size(with: collectionView.frame)
    } else if let _ = item as? CCImage.Displayed {
      return CCImage.Sizing.size(with: collectionView.frame,
                                 rowItems: 2,
                                 customItemSpace: 10,
                                 customItemLine: 10,
                                 customInset: UIEdgeInsets(inset: 10))
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let item = displayedCAProfile?.sections[section].items
    if let _ = item as? [CCProfile.Displayed] {
      return CCProfile.Sizing.inset()
    } else if let _ = item as? [CCImage.Displayed] {
      return CCImage.Sizing.inset()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAProfile?.sections[section].items
    if let _ = item as? [CCProfile.Displayed] {
      return CCProfile.Sizing.lineSpace()
    } else if let _ = item as? [CCImage.Displayed] {
      return CCImage.Sizing.lineSpace()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAProfile?.sections[section].items
    if let _ = item as? [CCProfile.Displayed] {
      return CCProfile.Sizing.itemSpace()
    } else if let _ = item as? [CCImage.Displayed] {
      return CCImage.Sizing.itemSpace()
    } else {
      return .zero
    }
  }
  
  
  
  //MARK: - Custom - AGCCDelegate
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Custom - AGCRVDelegate
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

