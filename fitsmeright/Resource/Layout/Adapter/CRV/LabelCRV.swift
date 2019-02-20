//
//  LabelCRV.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 24/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



class LabelCRVDisplayed: AGCRVDisplayed {
  var title: String = ""
}



extension LabelCRV
{
  
}



class LabelCRV: AGCRV {
  
  //MARK: - Enum
  enum Sizing: Sizeable {
    
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
  typealias Displayed = LabelCRVDisplayed
  
  
  
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
    v_topSeperator.backgroundColor = c_material.grey200
    v_bottomSeperator.backgroundColor = c_material.grey200
    
    
    
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
    setupData(with: Displayed())
  }
  
  override func setupData(with displayed: AGCRVDisplayed?) {
    
    if let displayed = displayed as? Displayed {
      self.displayedCRV = displayed
      lb_title.text = displayed.title
      switch displayed.kind {
      case UICollectionView.elementKindSectionHeader:
        v_topSeperator.isHidden = true
        v_bottomSeperator.isHidden = false
      case UICollectionView.elementKindSectionFooter:
        v_topSeperator.isHidden = false
        v_bottomSeperator.isHidden = true
      default:
        v_topSeperator.isHidden = true
        v_bottomSeperator.isHidden = true
      }
    } else {
      lb_title.text = ""
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
