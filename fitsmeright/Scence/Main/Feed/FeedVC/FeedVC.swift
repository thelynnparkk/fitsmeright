//
//  FeedVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 8/12/2561 BE.
//  Copyright © 2561 silpakorn. All rights reserved.
//



import UIKit



extension FeedVC:
  AGVCInstantiatable
{
  
}



class FeedVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  static var sb_name: String = "FeedVC"
  static var vc_name: String = "FeedVC"
  
  
  
  //MARK: - Action
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - UI
  
  @IBOutlet weak var sv_main: UIScrollView!
  @IBOutlet weak var btn_createPost: UIButton!
  @IBOutlet weak var v_post: PostView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var post: MockPost?
  
  
  
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
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchPostData()
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    //MARK: Core
//    let c = UIColor.Custom.self
//    let nb = navigationController?.navigationBar
//    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)

    navigationItem.title = FeedVC.sb_name
    
    
    
    //MARK: UI
    sv_main.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    btn_createPost.addTarget(self, action: #selector(createPostButtonPressed), for: .touchUpInside)
    v_post.isHidden = true
    
    
    //MARK: Misc

    
    
    
  }
  
  func setupSnp() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    
  }
  
  func fetchPostData() {
    if let post = FMUserDefaults.Post.get() {
      self.post = post
      displayFetchPostData()
    } else {
      displayFetchPostDataError()
    }
  }
  
  
  
  //MARK: - Event
  @objc
  func createPostButtonPressed(_ sender: UIButton) {
    let vc = CreatePostVC.vc
    let nvc = UINavigationController(rootViewController: vc)
    present(nvc, animated: true, completion: nil)
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  func displayFetchPostData() {
    if let post = post {
      v_post.isHidden = false
      v_post.setupPostData(post: post)
    }
  }
  
  func displayFetchPostDataError() {
    v_post.isHidden = true
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
