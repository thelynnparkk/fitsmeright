//
//  AGObject.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



public protocol AGObject {
  func mockBackgroundWaiting(_ time: UInt32, onComplete: @escaping CBVoid)
  func mockMainWaiting(_ time: Double, onComplete: @escaping CBVoid)
}



public extension AGObject {
  
  var window: UIWindow? {
    return (UIApplication.shared.delegate as? AppDelegate)?.window
  }
  
  public func mockBackgroundWaiting(_ time: UInt32 = 3, onComplete: @escaping CBVoid) {
    let qualityOfServiceClass = DispatchQoS.QoSClass.background
    let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
    backgroundQueue.async {
      sleep(time)
      DispatchQueue.main.async {
        onComplete()
      }
    }
  }
  
  public func mockMainWaiting(_ time: Double = 3.0, onComplete: @escaping CBVoid) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
      onComplete()
    }
  }
  
}

