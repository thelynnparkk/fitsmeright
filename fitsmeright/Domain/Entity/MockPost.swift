//
//  MockPost.swift
//  fitsmeright
//
//  Created by Lynn Park on 14/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension MockPost:
  Entitible
{
  
}



public class MockPost: Codable {
  
  //MARK: - Key
  public enum CodingKeys: String, CodingKey {
    case displayName
    case string_createdAt
    case img_clothSelected
    case img_backgroundSelected
    case string_textSelected
    case string_captionSelected
  }
  
  
  //MARK: - Storage
  var displayName: String?
  var string_createdAt: String?
  var img_clothSelected: [UIImage] = []
  var img_backgroundSelected: UIImage?
  var string_textSelected: String?
  var string_captionSelected: String?
  
  
  
  //MARK: - Initial
  public init() {
    
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(displayName, forKey: .displayName)
    try container.encode(string_createdAt, forKey: .string_createdAt)
    let imgs = img_clothSelected.map({ convertImageToBase64(image: $0) })
    try container.encode(imgs, forKey: .img_clothSelected)
    if let img = img_backgroundSelected {
      try container.encode(convertImageToBase64(image: img), forKey: .img_backgroundSelected)
    }
    try container.encode(string_textSelected, forKey: .string_textSelected)
    try container.encode(string_captionSelected, forKey: .string_captionSelected)
  }
  
  required public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    displayName = try? container.decode(String.self, forKey: .displayName)
    string_createdAt = try? container.decode(String.self, forKey: .string_createdAt)
    if let data = try? container.decode([String].self, forKey: .img_clothSelected) {
      img_clothSelected = data.compactMap({ convertBase64ToImage(imageString: $0) })
    }
    if let data = try? container.decode(String.self, forKey: .img_backgroundSelected) {
      img_backgroundSelected = convertBase64ToImage(imageString: data)
    }
    string_textSelected = try? container.decode(String.self, forKey: .string_textSelected)
    string_captionSelected = try? container.decode(String.self, forKey: .string_captionSelected)
  }
  
  
  //MARK: - Public
  public var _displayName: String {
    return displayName ?? ""
  }
  public var _string_createdAt: String {
    return string_createdAt ?? ""
  }
  public var _img_clothSelected: [UIImage] {
    return img_clothSelected
  }
  public var _img_backgroundSelected: UIImage {
    return img_backgroundSelected ?? UIImage()
  }
  public var _string_textSelected: String {
    return string_textSelected ?? ""
  }
  public var _string_captionSelected: String {
    return string_captionSelected ?? ""
  }
  
  
  
  //MARK: - Private
  private func convertImageToBase64(image: UIImage) -> String {
    let imageData = image.pngData()!
    return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
  }
  
  private func convertBase64ToImage(imageString: String) -> UIImage {
    let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
    return UIImage(data: imageData)!
  }
  
  
  
}
