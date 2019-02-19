//
//  SelectClosetCategoryCA.swift
//  fitsmeright
//
//  Created by Lynn Park on 19/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class SelectClosetCategoryCAUC {
  
  class ViewModel: AGCAModel {
    
  }
  
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
  typealias ViewModel = SelectClosetCategoryCAUC.ViewModel
  typealias CC = IconLabelCC
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  override var isEmpty: Bool {
    return false
  }
  
  
  
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
    collection.register(nibWithCellClass: CC.self)
    collection.delegate = self
    collection.dataSource = self
    collection.backgroundColor = .white
    collection.allowsSelection = true
    collection.contentInsetAdjustmentBehavior = .always
    collection.isPrefetchingEnabled = true
    
    let layout = UICollectionViewFlowLayout()
    collection.collectionViewLayout = layout
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnInit() {
    
  }
  
  override func setupData(with viewModel: AGCAModel) {
    if let vm = viewModel as? ViewModel {
      self.viewModel = vm
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
    guard !isEmpty else {
      return 0
    }
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard !isEmpty else {
      return 0
    }
    return viewModel.displayedItems.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard !isEmpty else {
      return UICollectionViewCell()
    }
    switch indexPath.section {
    case 0:
      let cell = collectionView.dequeueReusableCell(withClass: CC.self, for: indexPath)
      cell.indexPath = indexPath
      cell.delegate = self
      if let vm = viewModel as? ViewModel {
        let vm_profile = CC.ViewModel()
        vm_profile.displayedProfile = vm.displayedProfile
        cell.setupData(with: vm_profile)
      }
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withClass: CCImage.self, for: indexPath)
      let item = viewModel.displayedItems[indexPath.row]
      cell.indexPath = indexPath
      cell.delegate = self
      cell.setupData(with: item)
      return cell
    default:
      return UICollectionViewCell()
    }
  }
  
  //  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
  //    switch kind {
  //    case UICollectionView.elementKindSectionHeader:
  //      return UICollectionReusableView()
  //    case UICollectionView.elementKindSectionFooter:
  //      let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: CRV.self, for: indexPath)
  //      view.kind = kind
  //      view.section = indexPath.section
  //      view.delegate = self
  //      if let vm = viewModel as? ViewModel {
  //        let vm_footer = LabelCRVUC.ViewModel()
  //        vm_footer.displayedLabel = vm.displayedFooter
  //        view.setupData(with: vm_footer)
  //      }
  //      return view
  //    default:
  //      return UICollectionReusableView()
  //    }
  //  }
  
  
  
  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard !isEmpty else {
      return
    }
    switch indexPath.section {
    case 0:
      break
    case 1:
      if let _ = viewModel.displayedItems[indexPath.row] as? CCImageModel {
        delegate?.agCAPressed(self, action: [], indexPath: indexPath)
      }
    default:
      break
    }
    
  }
  
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
  //    return CRV.Sizing.size(with: collectionView.frame, height: 50)
  //  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard !isEmpty else {
      return .zero
    }
    switch indexPath.section {
    case 0:
      return CCProfile.Sizing.size(with: collectionView.frame)
    case 1:
      return CCImage.Sizing.size(with: collectionView.frame,
                                 rowItems: 2,
                                 customItemSpace: 10,
                                 customItemLine: 10,
                                 customInset: UIEdgeInsets(inset: 10))
    default:
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    guard !isEmpty else {
      return .zero
    }
    switch section {
    case 0:
      return CCProfile.Sizing.inset()
    case 1:
      return CCImage.Sizing.inset(custom: UIEdgeInsets(inset: 10))
    default:
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    guard !isEmpty else {
      return 0
    }
    switch section {
    case 0:
      return CCProfile.Sizing.lineSpace()
    case 1:
      return CCImage.Sizing.itemSpace(custom: 10)
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    guard !isEmpty else {
      return 0
    }
    switch section {
    case 0:
      return CCProfile.Sizing.itemSpace()
    case 1:
      return CCImage.Sizing.itemSpace(custom: 10)
    default:
      return 0
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
