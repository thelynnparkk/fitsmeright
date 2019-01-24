//
//  ImageCA.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class ImageCAModel: AGCAModel {
  var labelCRVModel: LabelCRVModel = LabelCRVModel()
}



extension ImageCA:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
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
  typealias Model =  ImageCAModel
  typealias CC = ImageCC
  typealias CCModel = ImageCCModel
  typealias CRV = LabelCRV
  typealias CRVModel = LabelCRVModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepare() {
    super.prepare()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnInit() {
    //MARK: Core
    
    
    
    //MARK: Component
    collection.setupCollectionDefault()
    collection.setupScrollVertical()
    collection.registerCellNib(CC.self)
    collection.registerHeaderFooterViewNib(CRV.self, kind: UICollectionView.elementKindSectionFooter)
    collection.delegate = self
    collection.dataSource = self
    collection.backgroundColor = .clear
    collection.allowsSelection = true
    collection.contentInsetAdjustmentBehavior = .always
    collection.isPrefetchingEnabled = true
    
    let layout = UICollectionViewFlowLayout()
//    layout.minimumInteritemSpacing = 10
//    layout.minimumLineSpacing = 0
//    layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 30, right: 1)
//    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    collection.collectionViewLayout = layout
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupData(with data: AGCAModel) {
    if let d = data as? Model {
      model = d
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
    switch isEmpty {
    case true:
      return 0
    case false:
      return model.displayedRows.count
    }
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch isEmpty {
    case true:
      return UICollectionViewCell()
    case false:
      let cell = collectionView.dequeueReusableCell(CC.self, for: indexPath)
      let item = model.displayedRows[indexPath.row]
      cell.indexPath = indexPath
      cell.delegate = self
      cell.setupData(with: item)
      return cell
    }
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
      if let d = model as? ImageCAModel {
        view.setupData(with: d.labelCRVModel)
      }
      return view
    default:
      return UICollectionReusableView()
    }
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch isEmpty {
    case true:
      break
    case false:
      if let _ = model.displayedRows[indexPath.row] as? CCModel {
        delegate?.agCAPressed(self, action: 0, indexPath: indexPath)
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CC.Sizing.size(with: collectionView.frame, rowItems: 4)
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
  func agCCPressed(_ cell: UICollectionViewCell, action: Any, indexPath: IndexPath) {
    
  }
  
  
  
  //MARK: - Custom - AGCRVDelegate
  func agCRVPressed(_ view: UICollectionReusableView, action: Any, section: Int) {
    
  }
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}
