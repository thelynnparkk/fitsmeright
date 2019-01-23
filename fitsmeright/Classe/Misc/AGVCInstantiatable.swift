//
//  InstantiatableController.swift
//  AugustFriday
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit


//ไว้สร้าง ViewController จาก Storyboard
public protocol AGVCInstantiatable {
  static var sb_name: String { get }
  static var vc_name: String { get }
  static var sb: UIStoryboard { get }
  static func create() -> Self
}



public extension AGVCInstantiatable where Self: UIViewController {
  
  
  //MARK: - Implement
  public static var sb_name: String {
    return String(describing: Self.self)
  }
  
  public static var vc_name: String {
    return String(describing: Self.self)
  }
  
  public static var sb: UIStoryboard {
    return UIStoryboard(name: sb_name, bundle: nil)
  }
  
  public static func create() -> Self {
    let vc = sb.instantiateViewController(withIdentifier: vc_name)
    return vc as! Self
  }
  
  
  
  //MARK: - Public
  public static var vc: Self {
    let vc = create()
    return vc
  }
  
  public static var nvc: UINavigationController {
    let vc = create()
    let nvc = UINavigationController(rootViewController: vc)
    return nvc
  }
  
  
  
  //MARK: - Private
  
  
  
  
}

