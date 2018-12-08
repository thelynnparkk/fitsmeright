//
//  AGVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension AGVC:
  UIBarPositioningDelegate,
  UIGestureRecognizerDelegate,
  AGObject
{ }



open class AGVC: UIViewController {

  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Apperance
  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
    
  }
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  
  
  //MARK: - Life cycle
  override open func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupViewOnWillAppear()
    
  }
  
  override open func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupViewOnDidAppear()
    
  }
  
  override open func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    setupViewOnWillDisappear()
    
  }
  
  override open func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    setupViewOnDidDisappear()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    NotificationCenter.default.removeObserver(self)
    
  }
  
  
  
  //MARK: - Setup View
  fileprivate func setupViewOnViewDidLoad() {
    interactivePopGestureEnable()
    
  }
  
  fileprivate func setupViewOnWillAppear() {
    
  }
  
  fileprivate func setupViewOnDidAppear() {
    
  }
  
  fileprivate func setupViewOnWillDisappear() {
    
  }
  
  fileprivate func setupViewOnDidDisappear() {
    
  }
  
  
  
  //MARK: - Setup Data
  fileprivate func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  public func interactivePopGestureEnable() {
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  public func interactivePopGestureDisable() {
    navigationController?.interactivePopGestureRecognizer?.delegate = nil
    navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
  
  @objc
  public func popButtonPressed(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc
  public func dismissButtonPressed(_ sender: Any) {
    var dissmiss = false
    if let nav = navigationController {
      if nav.viewControllers.count > 1 {
        nav.popViewController(animated: true)
      } else {
        dissmiss = true
      }
    } else {
      dissmiss = true
    }
    if dissmiss {
      dismiss(animated: true)
    }
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: Core - UIBarPositioningDelegate
  public func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
  
  
  
  //MARK: Core - UIBarPositioningDelegate
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    guard let gr = navigationController?.interactivePopGestureRecognizer, gr == gestureRecognizer else {
      return false
    }
    let count = navigationController?.viewControllers.count ?? 0
    return count > 1 ? true : false
  }
  
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
  
  
}












