//
//  OutfitItemXCC.swift
//  fitsmeright
//
//  Created by Lynn Park on 23/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class OutfitItemXCCDisplayed: AGCCDisplayed {
  var items: [OutfitItemCCDisplayed] = []
}



extension OutfitItemXCC:
  UICollectionViewDataSource,
  UICollectionViewDelegate,
  UICollectionViewDelegateFlowLayout,
  AGCCDelegate
{
  
}



class OutfitItemXCC: AGCC {
  
  //MARK: - Enum
  enum Sizing: Sizeable {
    
    static func size(with bound: CGRect = .zero,
                     customItemSpace: CGFloat? = nil,
                     customItemLine: CGFloat? = nil,
                     customInset: UIEdgeInsets? = nil) -> CGSize {
      let spaces = itemSpace(custom: customItemSpace)
      let insets = inset(custom: customInset).right + inset(custom: customInset).left
      let side = (bound.width - spaces - insets)
      return CGSize(width: side, height: 140)
    }
    
    static func itemSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 0
    }
    
    static func lineSpace(with bound: CGRect = .zero, custom: CGFloat? = nil) -> CGFloat {
      if let custom = custom {
        return custom
      }
      return 10
    }
    
    static func inset(with bound: CGRect = .zero, custom: UIEdgeInsets? = nil) -> UIEdgeInsets {
      if let custom = custom {
        return custom
      }
      return UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    static func offset(with bound: CGRect = .zero) -> CGPoint {
      return .zero
    }
    
  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var collection: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias Displayed = OutfitItemXCCDisplayed
  typealias CC = OutfitItemCC
  var displayedCCOutfitItemX: Displayed? {
    return displayedCC as? Displayed
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
    v_container.backgroundColor = .clear
    v_seperator.backgroundColor = c_material.grey200
    collection.setupCollectionDefault()
    collection.setupScrollHorizontal()
    collection.showsHorizontalScrollIndicator = false
    collection.register(nibWithCellClass: CC.self)
    collection.delegate = self
    collection.dataSource = self
    collection.backgroundColor = .clear
    collection.allowsSelection = true
    collection.contentInsetAdjustmentBehavior = .always
    collection.isPrefetchingEnabled = true
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collection.collectionViewLayout = layout
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupData(with: Displayed())
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnStateChange(_ state: UIControl.State) {
    switch state {
    case .normal:
      v_container.backgroundColor = .clear
    case .highlighted:
      v_container.backgroundColor = c_material.grey100
    case .disabled:
      v_container.backgroundColor = .clear
    case .selected:
      v_container.backgroundColor = .clear
    default:
      break
    }
  }
  
  
  
  //MARK: - SetupData
  override func setupData(with displayed: AGCCDisplayed?) {
    if let displayed = displayed as? Displayed {
      displayedCC = displayed
    } else {
      displayedCC = Displayed()
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
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let displayed = displayedCCOutfitItemX else {
      return 0
    }
    return displayed.items.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let _ = displayedCCOutfitItemX else {
      return UICollectionViewCell()
    }
    let cell = collectionView.dequeueReusableCell(withClass: CC.self, for: indexPath)
    cell.indexPath = indexPath
    cell.delegate = self
    cell.setupData(with: .none)
    return cell
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard let _ = displayedCCOutfitItemX else {
      return
    }
    let cell = cell as? CC
    let item = displayedCCOutfitItemX?.items[indexPath.row]
    item?.isAnimated = false
    cell?.setupData(with: item)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let _ = displayedCCOutfitItemX else {
      return
    }
    delegate?.agCCPressed(self, action: [], indexPath: indexPath)
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
    let inset = CC.Sizing.inset(with: collectionView.bounds, custom: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    let lineSpace: CGFloat = 0.0
    let itemSpace: CGFloat = 0.0
    return CC.Sizing.size(with: collectionView.bounds, customItemSpace: lineSpace, customItemLine: itemSpace, customInset: inset)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return CC.Sizing.inset(with: collectionView.bounds, custom: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CC.Sizing.lineSpace(with: collectionView.bounds, custom: 20)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return CC.Sizing.itemSpace(with: collectionView.bounds, custom: 20)
  }
  
  
  
  //MARK: - Custom - AGCCDelegate
  func agCCPressed(_ cell: AGCC, action: Any, indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
