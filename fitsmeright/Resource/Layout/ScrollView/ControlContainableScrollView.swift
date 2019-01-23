//
//  ControlContainableScrollView.swift
//  player
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//



// These let you start a touch on a control that's inside a scroll view,
// and then if you start dragging, it cancels the touch on the button
// and lets you scroll instead. Without these scroll view subclasses,
// controls in scroll views will eat touches that start in them, which
// prevents scrolling and makes the app feel broken.
//
// The UITextInput exception is for cases where you have a text field
// or a text view in a scroll view. If you press and hold there, you want
// to get the text editing magnifier cursor, instead of canceling the
// touch in the text input element.
//
// Ditto for UISlider and UISwitch: if the table view eats the drag gesture,
// they feel broken. Feel free to add your own exceptions if you have custom
// controls that require swiping or dragging to function.



import UIKit



final class ControlContainableScrollView: UIScrollView {
  
  override func touchesShouldCancel(in view: UIView) -> Bool {
    if view is UIControl
      && !(view is UITextInput)
      && !(view is UISlider)
      && !(view is UISwitch) {
      return true
    }
    
    return super.touchesShouldCancel(in: view)
  }
  
}



final class ControlContainableTableView: UITableView {
  
  override func touchesShouldCancel(in view: UIView) -> Bool {
    if view is UIControl
      && !(view is UITextInput)
      && !(view is UISlider)
      && !(view is UISwitch) {
      return true
    }
    
    return super.touchesShouldCancel(in: view)
  }
  
}



final class ControlContainableCollectionView: UICollectionView {
  
  override func touchesShouldCancel(in view: UIView) -> Bool {
    if view is UIControl
      && !(view is UITextInput)
      && !(view is UISlider)
      && !(view is UISwitch) {
      return true
    }
    
    return super.touchesShouldCancel(in: view)
  }
  
}
