//
//  TemplateCCA.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



//import UIKit
//import AugustFriday
//
//
//
////MARK: - TemplateCCAM
//struct TemplateCCAM: AGGenericCCAM {
//  var rows: [AGGenericCM] = []
//}
//
//
//
////MARK: - Extensions
//extension TemplateCCA:
//  AGChoicePopupAGGenericCCA,
//  UICollectionViewDataSource,
//  UICollectionViewDelegate,
//  UICollectionViewDelegateFlowLayout
//{ }
//
//
//
////MARK: - TemplateCCA
//class TemplateCCA: AGAdapter {
//
//  //MARK: - Action
//
//
//
//  //MARK: - UI
//  private(set) weak var collection: UICollectionView!
//
//
//
//  //MARK: - NSLayout
//
//
//
//  //MARK: - Constraint
//  typealias cc_using = TemplateCC
//
//
//
//  //MARK: - Instance
//  weak var delegate_generic: AGGenericCCADelegate?
//
//
//
//  //MARK: - Flag
//
//
//
//  //MARK: - Storage
//  var h_ccUsing: CGFloat {
//    return cc_using.SC.size().height
//  }
//  private(set) var displayed: TemplateCCAM = TemplateCCAM()
//
//
//
//  //MARK: - Initial
//  required init(collection: UICollectionView) {
//    super.init()
//    self.collection = collection
//    onInit()
//  }
//
//  deinit {
//    onDeinit()
//  }
//
//
//
//  //MARK: - Life cycle
//  func onInit() {
//    setupUI()
//  }
//
//  func onDeinit() {
//
//  }
//
//
//
//  //MARK: - Setup View
//  func setupUI() {
//    collection.setupDefault()
//    collection.delegate = self
//    collection.dataSource = self
//    collection.allowsSelection = true
//    collection.backgroundColor = KK.Cons.Color.white
//    collection.registerCellClass(cc_using.self)
//    collection.isUserInteractionEnabled = false
//
//    collection.showsVerticalScrollIndicator = false
//    collection.showsHorizontalScrollIndicator = false
//
//  }
//
//
//
//  //MARK: - Setup Data
//  func setupData(with data: AGGenericCCAM) {
//    if let d = data as? TemplateCCAM {
//      displayed = d
//      collection.isUserInteractionEnabled = true
//      collection.reloadData()
//    } else {
//
//    }
//  }
//
//
//
//  //MARK: - Event
//
//
//
//  //MARK: - Public
//
//
//
//  //MARK: - Private
//
//
//
//  //MARK: - Core - SkeletonCollectionViewDataSource
//  func numberOfSections(in collectionView: UICollectionView) -> Int {
//    return 1
//  }
//
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return displayed.rows.count
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(cc_using.self, for: indexPath)
//    let item = displayed.rows[indexPath.row]
//    cell.setupTag(with: indexPath)
//    cell.setupData(with: item)
//    return cell
//  }
//
//
//
//  //MARK: - Core - UICollectionViewDelegate
//  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    guard displayed.rows.count > 0 else {
//      return
//    }
//    if let _ = displayed.rows[indexPath.row] as? TemplateCCM {
//
//    }
//    delegate_generic?.genericCCAItemPressed(with: self, indexPath: indexPath)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    let flag_lastRow = indexPath.row == displayed.rows.count - 1
//    let cell = cell as? cc_using
//    cell?.v_seperator.isHidden = flag_lastRow
//  }
//
//  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//    super.agAdapterCollectionView(collectionView, didHighlightItemAt: indexPath)
//
//  }
//
//  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//    super.agAdapterCollectionView(collectionView, didUnhighlightItemAt: indexPath)
//
//  }
//
//
//
//  //MARK: - Core - UICollectionViewDelegateFlowLayout
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return TemplateCC.SC.size(with: collectionView.frame)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return TemplateCC.SC.lineSpace()
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    return TemplateCC.SC.itemSpace()
//  }
//
//
//
//  //MARK: - Custom - Protocol
//
//
//
//  //MARK: - Pods - Protocol
//
//
//
//}

