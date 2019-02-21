//
//  ImageCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



import Kingfisher



class ImageCADisplayed: AGCADisplayed {
  
}



extension ImageCA:
  UICollectionViewDataSourcePrefetching,
  UICollectionViewDataSource,
  UICollectionViewDelegate,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate,
  AGCRVDelegate
{
  
  
}



class ImageCA: AGCA {
  
  //MARK: - Enum
  
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = ImageCADisplayed
  typealias CC = ImageCC
  typealias CRV = LabelCRV
  var displayedCAImage: Displayed? {
    return displayedCA as? Displayed
  }
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  override var height: CGFloat {
    let rowItems = 4
    let rows = displayedCA.sections.map({ ($0.items.count.cgFloat / rowItems.cgFloat).rounded(.up) }).reduce(0, +)
    let image_items = CC.Sizing.size(with: collection.bounds, rowItems: rowItems).height * rows
    let image_spaces = (CC.Sizing.lineSpace() * (rows - 1))
    let image_insets = (CC.Sizing.inset().top + CC.Sizing.inset().bottom)
    let image = image_items + image_spaces + image_insets
    let footer = CRV.Sizing.size(with: collection.frame, height: 50).height
    return image + footer
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
    collection.register(nibWithCellClass: CRV.self, kind: UICollectionView.elementKindSectionFooter)
    collection.delegate = self
    collection.dataSource = self
    collection.backgroundColor = .clear
    collection.allowsSelection = true
    collection.contentInsetAdjustmentBehavior = .always
    collection.isPrefetchingEnabled = true
    collection.prefetchDataSource = self
    
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
  override func awakeFromNib() {
    super.awakeFromNib()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGCADisplayed?) {
    DispatchQueue.main.async { [weak self] in
      guard let _s = self else { return }
      if let displayed = displayed as? Displayed {
        _s.displayedCA = displayed
      } else {
        _s.displayedCA = Displayed()
      }
      _s.collection.reloadData()
      _s.collection.isUserInteractionEnabled = true
      _s.collection.collectionViewLayout.invalidateLayout()
      _s.collection.refreshControl?.endRefreshing()
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - UICollectionViewDataSourcePrefetching
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    var urls: [URL] = []
    for section in displayedCAImage!.sections.enumerated() {
      for row in section.element.items.enumerated() {
        guard let displayed = row.element as? CC.Displayed,
          let url = displayed.imageURL,
          indexPaths.contains(IndexPath(row: row.offset, section: section.offset)) else { continue }
        urls.append(url)
      }
    }
    ImagePrefetcher(urls: urls).start()
    //    for indexPath in indexPaths {
    //      if let _ = operations_loading[indexPath] {
    //        continue
    //      }
    //      let operation = RandomDelayOperation()
    //      q_loading.addOperation(operation)
    //      operations_loading[indexPath] = operation
    //    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
    //    for indexPath in indexPaths {
    //      if let operation = operations_loading[indexPath] {
    //        operation.cancel()
    //        operations_loading.removeValue(forKey: indexPath)
    //      }
    //    }
  }
  
  
  
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
    cell.indexPath = indexPath
    cell.delegate = self
    cell.setupData(with: .none)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CRV.Sizing.size(with: collectionView.bounds, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      return UICollectionReusableView()
    case UICollectionView.elementKindSectionFooter:
      let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: CRV.self, for: indexPath)
      view.kind = kind
      view.section = indexPath.section
      view.delegate = self
      view.setupData(with: displayedCAImage?.sections[indexPath.section].footer)
      return view
    default:
      return UICollectionReusableView()
    }
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !isRowInSectionEmpty(with: indexPath) else {
      return
    }
    let cell = cell as? CC
    let item = displayedCAImage?.sections[indexPath.section].items[indexPath.row] as? CC.Displayed
    item?.isAnimated = true
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
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CC.Sizing.size(with: collectionView.bounds, rowItems: 4)
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



