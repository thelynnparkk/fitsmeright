//
//  LabelCRV.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class LabelCRVUC {
  
  class DisplayedLabel {
    var kind: String = ""
    var title: String = ""
  }
  
  class ViewModel: AGCRVModel {
    var displayedLabel = DisplayedLabel()
  }
  
}



extension LabelCRV
{
  
}



class LabelCRV: AGCRV {
  
  //MARK: - Enum
  enum Sizing {
    
    static func size(with bound: CGRect = .zero, height: CGFloat = 50) -> CGSize {
      return CGSize(width: bound.width, height: height)
    }

  }
  
  
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var v_topSeperator: UIView!
  @IBOutlet weak var v_bottomSeperator: UIView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias ViewModel = LabelCRVUC.ViewModel
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  
  
  
  //MARK: - LifeCycle
  override func onInit() {
    
  }
  
  override func prepare() {
    
  }
  
  override func prepareToDeinit() {
    
  }
  
  override func onDeinit() {
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  
  
  //MARK: - SetupView
  override func setupViewOnAwakeFromNib() {
    //MARK: Core
    v_container.backgroundColor = .clear
    
    
    
    //MARK: Component
    lb_title.textAlignment = .center
    lb_title.textColor = c_material.grey
    v_topSeperator.backgroundColor = c_material.grey300
    v_bottomSeperator.backgroundColor = c_material.grey300
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
  }
  
  override func setupViewOnLayoutSubviews() {
    
  }
  
  override func setupViewOnPrepareForReuse() {
    
  }
  
  
  
  //MARK: - SetupData
  override func setupDataOnAwakeFromNib() {
    
  }
  
  override func setupDataOnPrepareForReuse() {
    
  }
  
  override func setupData(with viewModel: AGCRVModel) {
    guard let vm = viewModel as? ViewModel else { return }
    lb_title.text = vm.displayedLabel.title
    switch vm.displayedLabel.kind {
    case UICollectionView.elementKindSectionFooter:
      v_topSeperator.isHidden = false
      v_bottomSeperator.isHidden = true
    case UICollectionView.elementKindSectionFooter:
      v_topSeperator.isHidden = true
      v_bottomSeperator.isHidden = false
    default:
      v_topSeperator.isHidden = true
      v_bottomSeperator.isHidden = true
    }
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
