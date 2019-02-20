//
//  ClosetCategory.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension ClosetCategory:
  CaseIterable
{
  
}



enum ClosetCategory: Int {
  case dress = 1
  case jacket
  case hat
  case accessory
  case bag
  case shoe
  case top
  case bottom
  case sock
  
  //MARK: - Constraint
  static let `default` = ClosetCategory.dress
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  var name: String {
    var name = ""
    switch self {
    case .dress:
      name = "dress"
    case .jacket:
      name = "jacket"
    case .hat:
      name = "hat"
    case .accessory:
      name = "accessory"
    case .bag:
      name = "bag"
    case .shoe:
      name = "shoe"
    case .top:
      name = "top"
    case .bottom:
      name = "bottom"
    case .sock:
      name = "sock"
    }
    return name
  }
  
  var plural: String {
    var plural = ""
    switch self {
    case .dress:
      plural = "dresses"
    case .jacket:
      plural = "jackets"
    case .hat:
      plural = "hats"
    case .accessory:
      plural = "accessories"
    case .bag:
      plural = "bags"
    case .shoe:
      plural = "shoes"
    case .top:
      plural = "tops"
    case .bottom:
      plural = "bottoms"
    case .sock:
      plural = "socks"
    }
    return plural
  }
  
  var icon: UIImage {
    var icon: UIImage = UIImage()
    switch self {
    case .dress:
      icon = #imageLiteral(resourceName: "ic_closetmenu_dress")
    case .jacket:
      icon = #imageLiteral(resourceName: "ic_closetmenu_jacket")
    case .hat:
      icon = #imageLiteral(resourceName: "ic_closetmenu_hat")
    case .accessory:
      icon = #imageLiteral(resourceName: "ic_closetmenu_accessory")
    case .bag:
      icon = #imageLiteral(resourceName: "ic_closetmenu_bag")
    case .shoe:
      icon = #imageLiteral(resourceName: "ic_closetmenu_shoe")
    case .top:
      icon = #imageLiteral(resourceName: "ic_closetmenu_top")
    case .bottom:
      icon = #imageLiteral(resourceName: "ic_closetmenu_bottom")
    case .sock:
      icon = #imageLiteral(resourceName: "ic_closetmenu_sock")
    }
    return icon
  }
  

  
  //MARK: - Private
  
  
  
}
