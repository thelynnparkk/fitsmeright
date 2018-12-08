//
//  TemplateAFApi.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



//import AugustFriday
//
//
//
////MARK: - TemplateAFApi
//public class TemplateAFApi {
//  
//  //  class let agam =
//  
//  //MARK: - GetAvatar
//  public typealias CBGetAvatar = (AGDataResponse<GetTemplate.Response>) -> ()
//  public class func getAvatar(_ param: GetTemplate.Request,
//                              onComplete: @escaping CBGetAvatar) {
//    let endpoint = TemplateAFR.template(param)
//    AGAlamofireManager.shared.requestJSON(endpoint) {
//      let data = GetTemplate.Response(json: $0.data)
//      onComplete(AGDataResponse<GetTemplate.Response>(data: data, error: $0.error))
//    }
//  }
//  
//}
//
//
//
