//
//  PostFormVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 29/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift
import FirebaseStorage
import FirebaseFirestore



extension PostFormVC:
  AGVCDelegate,
  AGViewDelegate,
  AGCADelegate
{
  
}



class PostFormVC: AGVC {
  
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  var bbi_done: UIBarButtonItem!
  var v_state: StateView!
  @IBOutlet weak var txt_caption: UITextField!
  @IBOutlet weak var btn_deletePost: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var postSelected: Post?
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Initial
  override func setupInit() {
    super.setupInit()
    //MARK: Core
    
    
    
    //MARK: Component
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    
    
    
    //MARK: Data
  }
  
  override func setupPrepare() {
    super.setupPrepare()
    
  }
  
  override func setupDeinit() {
    super.setupDeinit()
    
  }
  
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    view.backgroundColor = .white
    
    
    
    //MARK: Component
    view.setupViewFrame()
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(buttonPressed))
    ni.rightBarButtonItems = [bbi_done]
    
    txt_caption.borderStyle = .none
    let attributedPlaceholder: [NSAttributedString.Key : Any] = [
      .font: UIFont(name: f_system.helvetica, size: f_size.h4)!
    ]
    txt_caption.attributedPlaceholder = NSAttributedString(string: "Add a caption..", attributes: attributedPlaceholder)
    
    btn_deletePost.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_deletePost.setupLight()
    btn_deletePost.layer.cornerRadius = btn_deletePost.frame.size.height / 2
    btn_deletePost.clipsToBounds = true
    btn_deletePost.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
  
    v_state = StateView(axis: .vertical)
    v_state.setupDark()
    v_state.delegate = self
    view.addSubview(v_state)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    v_state.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchPost()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func buttonPressed(_ sender: UIBarButtonItem) {
    switch sender {
    case bbi_done:
      updatePost()
    case btn_deletePost:
      displayConfirmDeleteClosetPopup()
    default:
      break
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ""
    btn_deletePost.setTitleForAllStates("Delete")
  }
  
  
  
  //MARK: - Private
  private func displayConfirmDeleteClosetPopup() {
    func getLabelCAModel() -> LabelCADisplayed {
      let displayed = LabelCADisplayed()
      let displayed_delete = LabelCCDisplayed()
      displayed_delete.title = "Delete"
      displayed_delete.weight = .semibold
      displayed_delete.style = .normal
      let displayed_cancel = LabelCCDisplayed()
      displayed_cancel.title = "Cancel"
      displayed_cancel.weight = .semibold
      displayed_cancel.style = .negative
      let section = LabelCADisplayed.Section()
      section.items = [displayed_delete, displayed_cancel]
      displayed.sections = [section]
      return displayed
    }
    let displayed = PopupListVCUC.Setup.DisplayedSetupPopupList()
    displayed.viewModel = getLabelCAModel()
    displayed.adapter = LabelCA.self
    displayed.isTapOverlayEnabled = true
    displayed.isTapContainerEnabled = true
    displayed.isHideFooter = true
    displayed.displayedHeader.icon = #imageLiteral(resourceName: "ic_popup_trash").filled(withColor: c_custom.peach)
    displayed.displayedHeader.style = .large
    displayed.displayedHeader.subtitle = "Please confirm to delete."
    displayed.displayedHeader.tint = c_custom.peach
    displayed.displayedHeader.title = "Delete post?"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.deletePost()
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - VIP - FetchPost
  func fetchPost() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      worker()
    }
    func worker() {
      presenter()
    }
    func presenter() {
      v_state.setState(with: .hidden)
      txt_caption.text = postSelected?.fsPost?.caption
    }
    func presenterError() {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  //MARK: - VIP - UpdatePost
  func updatePost() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      guard let postSelected = postSelected else {
        presenterError(code: 0)
        return
      }
      postSelected.fsPost?.caption = txt_caption.text
      worker(post: postSelected)
    }
    func worker(post: Post) {
      func deletePost() {
        FSPostWorker.update(fsPost: post._fsPost) {
          switch $0 {
          case .none:
            deletePostCloset()
            presenter()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func deletePostCloset() {
        for i in post.postClosetList {
          FSPostClosetWorker.delete(documentId: i._fsPostCloset._documentId) {
            switch $0 {
            case .none:
              break
            case let .some(e):
              print(e.localizedDescription)
              break
            }
          }
        }
      }
      deletePost()
    }
    func presenter() {
      v_state.setState(with: .hidden)
      nvc?.popToRootViewController(animated: true)
    }
    func presenterError(code: Int) {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  //MARK: - VIP - DeletePost
  func deletePost() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      guard let postSelected = postSelected else {
        presenterError(code: 0)
        return
      }
      worker(fsPost: postSelected._fsPost)
    }
    func worker(fsPost: FSPost) {
      FSPostWorker.delete(documentId: fsPost._documentId) {
        switch $0 {
        case .none:
          presenter()
        case let .some(e):
          presenterError(code: 0)
          print(e.localizedDescription)
        }
      }
    }
    func presenter() {
      v_state.setState(with: .hidden)
      nvc?.popToRootViewController(animated: true)
    }
    func presenterError(code: Int) {
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGVCDelegate
  func agVCPressed(_ vc: AGVC, action: Any) {

  }
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    
  }
  
  
  
  //MARK: - Custom - AGCADelegate
  func agCAPressed(_ adapter: AGCA, action: Any, indexPath: IndexPath) {
    
  }
  
  

  //MARK: - Pods - Protocol
  
  
  
}
