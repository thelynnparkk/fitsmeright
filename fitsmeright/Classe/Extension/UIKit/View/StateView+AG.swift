//
//  StateView+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift



extension StateView {
  
  //MARK: - Implement
  
  
  
  //MARK: - Public
  func setupDark() {
    let setting = StateViewDisplayed.Setting()
    let displayed = StateViewDisplayed()
    displayed.hidden = setting
    displayed.loading = setting
    displayed.noResults = setting
    displayed.noConnection = setting
    displayed.error = setting
    self.displayed = displayed
  }
  
  func setupLight() {
    let s_hidden = StateViewDisplayed.Setting()
    let s_loading = StateViewDisplayed.Setting()
    s_loading.isIndicatorHidden = false
    s_loading.tint = .white
    s_loading.img_icon = nil
    s_loading.img_background = UIImage(color: c_custom.peach, size: .less)
    let s_noResults = StateViewDisplayed.Setting()
    s_noResults.title = "No result"
    s_noResults.description = "The data you request is empty"
    s_noResults.tint = c_custom.peach
    s_noResults.img_icon = nil
    s_noResults.img_background = UIImage(color: .white, size: .less)
    let s_noConnection = StateViewDisplayed.Setting()
    s_noConnection.title = "Poor connection"
    s_noConnection.description = "Network slow, not connect to the internet"
    s_noConnection.tint = c_custom.peach
    s_noConnection.img_icon = nil
    s_noConnection.img_background = UIImage(color: .white, size: .less)
    let s_error = StateViewDisplayed.Setting()
    s_error.title = "Something went wrong"
    s_error.description = "Please try again"
    s_error.tint = c_custom.peach
    s_error.img_icon = nil
    s_error.img_background = UIImage(color: .white, size: .less)
    let displayed = StateViewDisplayed()
    displayed.hidden = s_hidden
    displayed.loading = s_loading
    displayed.noResults = s_noResults
    displayed.noConnection = s_noConnection
    displayed.error = s_error
    self.displayed = displayed
  }
  
  
  
  //MARK: - Private
  
  
  
}
