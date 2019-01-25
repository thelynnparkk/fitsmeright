//
//  StateView+AG.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 23/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//




import UIKit



extension StateView {
  
  static var `default`: StateViewModel.ViewModel {
    let setting = StateViewModel.Setting()
    let displayedStates = StateViewModel.DisplayedState()
    displayedStates.hidden = setting
    displayedStates.loading = setting
    displayedStates.noResults = setting
    displayedStates.noConnection = setting
    displayedStates.error = setting
    let vm = StateViewModel.ViewModel()
    vm.displayedStates = displayedStates
    return vm
  }
  
  static var light: StateViewModel.ViewModel {
    let s_hidden = StateViewModel.Setting()
    let s_loading = StateViewModel.Setting()
    s_loading.isIndicatorHidden = false
    s_loading.tint = .white
    s_loading.img_background = UIImage(color: c_custom.peach, size: .less)
    let s_noResults = StateViewModel.Setting()
    s_noResults.title = "No result"
    s_noResults.description = "The data you request is empty"
    s_noResults.tint = .white
    s_noResults.img_background = UIImage(color: c_custom.peach, size: .less)
    let s_noConnection = StateViewModel.Setting()
    s_noConnection.title = "Poor connection"
    s_noConnection.description = "Network slow, not connect to the internet"
    s_noConnection.tint = .white
    s_noConnection.img_background = UIImage(color: c_custom.peach, size: .less)
    let s_error = StateViewModel.Setting()
    s_error.title = "Something went wrong"
    s_error.description = "Please try again"
    s_error.tint = .white
    s_error.img_background = UIImage(color: c_custom.peach, size: .less)
    let displayedStates = StateViewModel.DisplayedState()
    displayedStates.hidden = s_hidden
    displayedStates.loading = s_loading
    displayedStates.noResults = s_noResults
    displayedStates.noConnection = s_noConnection
    displayedStates.error = s_error
    let vm = StateViewModel.ViewModel()
    vm.displayedStates = displayedStates
    return vm
  }
  
}
