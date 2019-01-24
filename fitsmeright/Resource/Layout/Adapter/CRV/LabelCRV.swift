//
//  LabelCRV.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



class LabelCRVModel: AGCRVModel {
  var kind: String = ""
  var title: String = ""
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
  typealias Model = LabelCRVModel
  
  
  
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
    
    
    
    //MARK: Component
    lb_title.textAlignment = .center
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
  
  override func setupData(with data: AGCRVModel) {
    guard let d = data as? Model else { return }
    lb_title.text = d.title
    switch d.kind {
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
