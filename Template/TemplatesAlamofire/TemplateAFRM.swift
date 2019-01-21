//
//  TemplateRM.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



//import UIKit
//
//
//
////MARK: - GetTemplate
//public struct GetTemplate {
//
//  public struct Request: AGRouterRequest {
//
//    //MARK: - Storage
//
//
//
//    //MARK: - Getter
//    public var param: Parameters {
//      let param = Parameters()
//      return param
//    }
//
//  }
//
//  public struct Response: AGRouterResponse {
//
//    //MARK: - Storage
//    public var _operation_status: AGOperationStatus?
//
//
//
//    //MARK: - Initial
//    public init?(json: JSON?) {
//      guard let json = json else {
//        return
//      }
//      guard json[Key.data].exists() else {
//        return
//      }
//      _operation_status = AGOperationStatus(json: json)
//    }
//
//
//
//    //MARK: - Getter
//    public var operation_status: AGOperationStatus {
//      return _operation_status ?? AGOperationStatus()
//    }
//
//
//
//    //MARK: - Key
//    public enum Key {
//      public static var operation_status = "operation_status"
//      public static var data = "data"
//    }
//
//  }
//
//}
//
//
//
//
//
//
