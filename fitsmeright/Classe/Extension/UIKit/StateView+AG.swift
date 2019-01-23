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
    let displayedStates = StateViewModel.DisplayedState(hidden: setting,
                                                        loading: setting,
                                                        noResults: setting,
                                                        noConnection: setting,
                                                        error: setting)
    return StateViewModel.ViewModel(displayedStates: displayedStates)
  }
  
  static var light: StateViewModel.ViewModel {
    let s_hidden = StateViewModel.Setting()
    var s_loading = StateViewModel.Setting()
    s_loading.isIndicatorHidden = false
    s_loading.tint = .white
    s_loading.img_background = UIImage(color: c_custom.peach, size: .less)
    var s_noResults = StateViewModel.Setting()
    s_noResults.title = "No result"
    s_noResults.description = "The data you request is empty"
    s_noResults.tint = .white
    s_noResults.img_background = UIImage(color: c_custom.peach, size: .less)
    var s_noConnection = StateViewModel.Setting()
    s_noConnection.title = "Poor connection"
    s_noConnection.description = "Network slow, not connect to the internet"
    s_noConnection.tint = .white
    s_noConnection.img_background = UIImage(color: c_custom.peach, size: .less)
    var s_error = StateViewModel.Setting()
    s_error.title = "Something went wrong"
    s_error.description = "Please try again"
    s_error.tint = .white
    s_error.img_background = UIImage(color: c_custom.peach, size: .less)
    let displayedStates = StateViewModel.DisplayedState(hidden: s_hidden,
                                                        loading: s_loading,
                                                        noResults: s_noResults,
                                                        noConnection: s_noConnection,
                                                        error: s_error)
    return StateViewModel.ViewModel(displayedStates: displayedStates)
  }
  
}
