//
//  ClosetRelateCA.swift
//  fitsmeright
//
//  Created by Lynn Park on 25/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ClosetRelateCADisplayed: AGCADisplayed {
  
}



extension ClosetRelateCA:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate,
  AGCRVDelegate
{
  
  
}



class ClosetRelateCA: AGCA {
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = ClosetRelateCADisplayed
  typealias CRV = LabelCRV
  typealias CC_OutfitItemX = OutfitItemXCC
  var displayedCAClosetRelate: Displayed? {
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
    collection.register(nibWithCellClass: CRV.self, kind: UICollectionView.elementKindSectionHeader)
    collection.register(nibWithCellClass: CC_OutfitItemX.self)
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
    let item = displayedCAClosetRelate?.sections[indexPath.section].items[indexPath.row]
    if let item = item as? CC_OutfitItemX.Displayed {
      let cell = collectionView.dequeueReusableCell(withClass: CC_OutfitItemX.self, for: indexPath)
      cell.indexPath = indexPath
      cell.delegate = self
      item.isAnimated = false
      cell.setupData(with: item)
      cell.v_seperator.isHidden = true
      return cell
    } else {
      return UICollectionViewCell()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: CRV.self, for: indexPath)
      view.kind = kind
      view.section = indexPath.section
      view.delegate = self
      view.lb_title.font = UIFont(name: f_system.helveticaBold, size: f_size.h2)
      view.lb_title.textAlignment = .left
      view.lb_title.textColor = .black
      view.setupData(with: displayedCAClosetRelate?.sections[indexPath.section].header)
      return view
    case UICollectionView.elementKindSectionFooter:
      return UICollectionReusableView()
    default:
      return UICollectionReusableView()
    }
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    collectionView.deselectItem(at: indexPath, animated: true)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    guard let header = displayedCAClosetRelate?.sections[section].header, !header.isHidden else {
      return .zero
    }
    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  }
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let item = displayedCAClosetRelate?.sections[indexPath.section].items[indexPath.row]
    if let _ = item as? CC_OutfitItemX.Displayed {
      return CC_OutfitItemX.Sizing.size(with: collectionView.frame)
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let item = displayedCAClosetRelate?.sections[section].items
    if let _ = item as? [CC_OutfitItemX.Displayed] {
      return CC_OutfitItemX.Sizing.inset()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAClosetRelate?.sections[section].items
    if let _ = item as? [CC_OutfitItemX.Displayed] {
      return CC_OutfitItemX.Sizing.lineSpace()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAClosetRelate?.sections[section].items
    if let _ = item as? [CC_OutfitItemX.Displayed] {
      return CC_OutfitItemX.Sizing.itemSpace()
    } else {
      return .zero
    }
  }
  
  
  
  //MARK: - Custom - AGCCDelegate
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath) {
//    switch cell {
//    case is PostHeaderCC:
//      if let action = action as? CC_PostHeader.Action {
//        switch action {
//        case .doubleTap:
//          delegate?.agCAPressed(self, action: Action.doubleTap, indexPath: indexPath)
//        }
//      }
//    case is OutfitItemXCC:
//      delegate?.agCAPressed(self, action: Action.items, indexPath: indexPath)
//    default:
//      break
//    }
  }
  
  
  
  //MARK: - Custom - AGCRVDelegate
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

