//
//  UIImage+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 10/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



public extension UIImage {
  
  public class func withColor(_ color: UIColor) -> UIImage? {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  public func overlay(with color: UIColor) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()
    color.setFill()
    context?.translateBy(x: 0, y: size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    context?.setBlendMode(CGBlendMode.colorBurn)
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    guard let cgImage = cgImage else { return nil }
    context?.draw(cgImage, in: rect)
    context?.setBlendMode(CGBlendMode.sourceIn)
    context?.addRect(rect)
    context?.drawPath(using: CGPathDrawingMode.fill)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  
  public func overlay(with colors: UIColor..., axis: NSLayoutConstraint.Axis) -> UIImage? {
    guard colors.count > 1 else { return nil }
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()
    context?.saveGState()
    context?.translateBy(x: 0, y: size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    context?.setBlendMode(CGBlendMode.colorBurn)
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    guard let cgImage = cgImage else { return nil }
    context?.draw(cgImage, in: rect)
    context?.setBlendMode(CGBlendMode.sourceIn)
    context?.addRect(rect)
    let locations: [CGFloat] = [0.0, 1.0]
    let cg_colors = colors[0...1].map({ $0.cgColor })
    let c_space = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: c_space,
                              colors: cg_colors as CFArray, locations: locations)
    var startPoint = CGPoint()
    var endPoint =  CGPoint()
    switch axis {
    case .horizontal:
      startPoint = CGPoint(x: 0.0, y: size.height / 2)
      endPoint = CGPoint(x: size.width, y: size.height / 2)
    case .vertical:
      startPoint = CGPoint(x: size.width / 2, y: 0.0)
      endPoint = CGPoint(x: size.width / 2, y: size.height)
    }
    context?.drawLinearGradient(gradient!,
                                start: startPoint, end: endPoint,
                                options: [])
    context?.restoreGState()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  
}

