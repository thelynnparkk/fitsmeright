//
//  PostListCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class PostListCADisplayed: AGCADisplayed {
  
}



extension PostListCA:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate,
  AGCRVDelegate
{
  
  
}



class PostListCA: AGCA {
  
  //MARK: - Enum
  enum Action {
    case tap
    case doubleTap
  }
  
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = PostListCADisplayed
  typealias CC = PostCC
  var displayedCAPostList: Displayed? {
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
    let item = displayedCAPostList?.sections[indexPath.section].items[indexPath.row]
    if let item = item as? CC.Displayed {
      let cell = collectionView.dequeueReusableCell(withClass: CC.self, for: indexPath)
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
    collectionView.deselectItem(at: indexPath, animated: true)
  }
  
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
  //    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  //  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let item = displayedCAPostList?.sections[indexPath.section].items[indexPath.row]
    if let _ = item as? CC.Displayed {
      return CC.Sizing.size(with: collectionView.frame)
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let item = displayedCAPostList?.sections[section].items
    if let _ = item as? [CC.Displayed] {
      return CC.Sizing.inset()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAPostList?.sections[section].items
    if let _ = item as? [CC.Displayed] {
      return CC.Sizing.lineSpace()
    } else {
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let item = displayedCAPostList?.sections[section].items
    if let _ = item as? [CC.Displayed] {
      return CC.Sizing.itemSpace()
    } else {
      return .zero
    }
  }
  
  
  
  //MARK: - Custom - AGCCDelegate
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath) {
    if let action = action as? CC.Action {
      switch action {
      case .tap:
        delegate?.agCAPressed(self, action: Action.tap, indexPath: indexPath)
      case .doubleTap:
        delegate?.agCAPressed(self, action: Action.doubleTap, indexPath: indexPath)
      }
    }
  }
  
  
  
  //MARK: - Custom - AGCRVDelegate
  func agCRVPressed(_ view: AGCRV, action: Any, section: Int) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}

