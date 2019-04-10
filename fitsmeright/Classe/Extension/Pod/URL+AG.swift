//
//  URL+AG.swift
//  fitsmeright
//
//  Created by Lynn Park on 10/4/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import Foundation



extension URL {

  struct Image {
    static func facebook(_ id: String) -> URL? {
      return "https://graph.facebook.com/\(id)/picture?type=large".url
    }
  }
  
}

