//
//  ClosetFormVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import FirebaseStorage
import FirebaseFirestore



extension ClosetFormVC:
UITextFieldDelegate,
AGViewDelegate
{
  
}



class ClosetFormVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  enum Action {
    case update(FSCloset)
  }
  
  
  
  //MARK: - UI
  var bbi_done: UIBarButtonItem!
  var v_state: StateView!
  
  @IBOutlet weak var sv_container: UIScrollView!
  @IBOutlet weak var imgv_closet: UIImageView!
  @IBOutlet weak var imgv_addCloset: UIImageView!
  @IBOutlet weak var v_addCloset: UIView!
  @IBOutlet weak var btn_chooseCloset: UIButton!
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var v_brand: ClosetFormView!
  @IBOutlet weak var v_price: ClosetFormView!
  @IBOutlet weak var v_size: ClosetFormView!
  @IBOutlet weak var v_deleteCloset: UIView!
  @IBOutlet weak var btn_deleteCloset: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsCloset: FSCloset?
  var closetCategory: ClosetCategory?
  
  
  
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
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(buttonPressed))
    ni.rightBarButtonItems = [bbi_done]
    
    
    
    //MARK: Component
    view.setupViewFrame()
    sv_container.setupScrollVertical()
    imgv_closet.contentMode = .scaleAspectFill
    v_addCloset.backgroundColor = c_custom.peach
    v_addCloset.layer.cornerRadius = v_addCloset.bounds.width / 2
    v_addCloset.contentMode = .scaleAspectFit
    v_addCloset.clipsToBounds = true
    imgv_addCloset.contentMode = .scaleAspectFit
    v_seperator.backgroundColor = c_material.grey300
    btn_chooseCloset.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    v_brand.txt_value.delegate = self
    v_price.txt_value.delegate = self
    v_size.txt_value.delegate = self
    
    btn_deleteCloset.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    btn_deleteCloset.setupLight()
    btn_deleteCloset.layer.cornerRadius = btn_deleteCloset.frame.size.height / 2
    btn_deleteCloset.clipsToBounds = true
    btn_deleteCloset.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    v_state = StateView(axis: .vertical)
    v_state.setupLight()
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
    if let _ = closetCategory, let _ = fsCloset {
      fetchClosetEdit()
    } else {
      fetchClosetAdd()
    }
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @IBAction func buttonPressed(_ sender: UIButton) {
    switch sender {
    case bbi_done:
      if let _ = closetCategory, let _ = fsCloset {
        updateCloset()
      } else {
        addCloset()
      }
    case btn_chooseCloset:
      displayImagePickerPopup()
    case btn_deleteCloset:
      displayConfirmDeleteClosetPopup()
    default:
      break
    }
    
    
    
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetFormVC.sb_name
    btn_deleteCloset.setTitleForAllStates("Delete")
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
    displayed.displayedHeader.title = "Delete Cloth?"
    let vm = PopupListVCUC.Setup.ViewModel()
    vm.displayedSetup = displayed
    displayPopupList(vm, priority: .common, on: self) { [weak self] in
      guard let _s = self else { return }
      guard $0.isSelected else { return }
      switch $0.indexPath.row {
      case 0:
        _s.deleteCloset()
      default:
        break
      }
    }
  }
  
  
  
  //MARK: - VIP - FetchClosetAdd
  func fetchClosetAdd() {
    func interactor() {
      worker()
    }
    func worker() {
      present()
    }
    func present() {
      ni.title = closetCategory!.name.capitalized
      let vm_brand = ClosetFormViewDisplayed()
      vm_brand.key = "Brand"
      vm_brand.placeHolder = "Add Brand"
      let vm_price = ClosetFormViewDisplayed()
      vm_price.key = "Price"
      vm_price.placeHolder = "Add Price"
      let vm_size = ClosetFormViewDisplayed()
      vm_size.key = "Size"
      vm_size.placeHolder = "Add Size"
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      bbi_done.isEnabled = false
      imgv_addCloset.image = closetCategory?.iconAdd
      v_deleteCloset.isHidden = true
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - FetchClosetEdit
  func fetchClosetEdit() {
    func interactor() {
      worker()
    }
    func worker() {
      present()
    }
    func present() {
      ni.title = closetCategory!.name.capitalized
      if let imageURL = fsCloset!.imageURL {
        imgv_closet.kf.setImage(with: imageURL, placeholder: nil, options: nil)
      } else {
        imgv_closet.image = nil
      }
      v_addCloset.isHidden = true
      imgv_addCloset.isHidden = true
      let vm_brand = ClosetFormViewDisplayed()
      vm_brand.key = "Brand"
      vm_brand.placeHolder = "Add Brand"
      vm_brand.value = fsCloset!._brand
      let vm_price = ClosetFormViewDisplayed()
      vm_price.key = "Price"
      vm_price.placeHolder = "Add Price"
      vm_price.value = "\(fsCloset!._price)"
      let vm_size = ClosetFormViewDisplayed()
      vm_size.key = "Size"
      vm_size.placeHolder = "Add Size"
      vm_size.value = fsCloset!._size
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - AddCloset
  func addCloset() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      bbi_done.isEnabled = false
      let fsUser = UserDefaults.FSUserDefault.get()!
      let fsCloset = FSCloset()
      fsCloset.userId = fsUser._documentId
      fsCloset.category = closetCategory?.rawValue
      fsCloset.image = ""
      fsCloset.price = v_price.txt_value.text?.int ?? 0
      fsCloset.brand = v_brand.txt_value.text
      fsCloset.size = v_size.txt_value.text
      fsCloset.updatedAt = Timestamp(date: Date())
      worker(fsCloset: fsCloset)
    }
    func worker(fsCloset: FSCloset) {
      func uploadClosetImage() {
        FSWorker.uploadImage(folder: SCloset.folder, image: imgv_closet.image) {
          switch $0.error {
          case .none:
            fsCloset.image = $0.url?.absoluteString
            addCloset()
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      func addCloset() {
          FSClosetWorker.add(fsCloset: fsCloset) {
          switch $0.error {
          case .none:
            present()
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      uploadClosetImage()
    }
    func present() {
      v_state.setState(with: .hidden) { [weak self] in
        guard let _s = self else { return }
        _s.navigationController?.popToRootViewController(animated: true)
      }
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
      bbi_done.isEnabled = true
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - UpdateCloset
  func updateCloset() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      bbi_done.isEnabled = false
      let fsUser = UserDefaults.FSUserDefault.get()!
      let fsCloset = FSCloset()
      fsCloset.documentId = self.fsCloset?._documentId
      fsCloset.userId = fsUser._documentId
      fsCloset.category = closetCategory?.rawValue
      fsCloset.image = ""
      fsCloset.price = v_price.txt_value.text?.int ?? 0
      fsCloset.brand = v_brand.txt_value.text
      fsCloset.size = v_size.txt_value.text
      fsCloset.updatedAt = Timestamp(date: Date())
      worker(fsCloset: fsCloset)
    }
    func worker(fsCloset: FSCloset) {
      func uploadClosetImage() {
        FSWorker.uploadImage(folder: SCloset.folder, image: imgv_closet.image) {
          switch $0.error {
          case .none:
            FSWorker.deleteImage(url: self.fsCloset!._image)
            fsCloset.image = $0.url?.absoluteString
            updateCloset()
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      func updateCloset() {
        FSClosetWorker.update(fsCloset: fsCloset) {
          switch $0 {
          case .none:
            present(fsCloset: fsCloset)
          case let .some(e):
            presentError()
            print(e.localizedDescription)
          }
        }
      }
      uploadClosetImage()
    }
    func present(fsCloset: FSCloset) {
      v_state.setState(with: .hidden)
      delegate_agvc?.agVCPressed(self, action: Action.update(fsCloset))
    }
    func presentError() {
      v_state.setState(with: .error, isAnimation: false)
      bbi_done.isEnabled = true
    }
    interactor()
  }
  
  
  
  //MARK: - VIP - DeleteCloset
  func deleteCloset() {
    func interactor() {
      v_state.setState(with: .loading, isAnimation: false)
      bbi_done.isEnabled = false
      guard let fsCloset = fsCloset else {
        presenterError(code: 0)
        return
      }
      worker(fsCloset: fsCloset)
    }
    func worker(fsCloset: FSCloset) {
      func deleteCloset() {
        FSClosetWorker.delete(documentId: fsCloset._documentId) {
          switch $0 {
          case .none:
            FSWorker.deleteImage(url: fsCloset._image)
            fetchPostCloset()
          case let .some(e):
            presenterError(code: 0)
            print(e.localizedDescription)
          }
        }
      }
      func fetchPostCloset() {
        FSPostClosetWorker.fetchWhere(closetId: fsCloset._documentId) {
          switch $0.error {
          case .none:
            deletePostCloset(fsPostClosetList: $0.data)
          case let .some(e):
            print(e.localizedDescription)
            deletePostCloset(fsPostClosetList: [])
          }
        }
      }
      func deletePostCloset(fsPostClosetList: [FSPostCloset]) {
        let dg = DispatchGroup()
        for i in fsPostClosetList {
          dg.enter()
          FSPostClosetWorker.delete(documentId: i._documentId) { [weak self] in
            guard let _ = self else { return }
            dg.leave()
            switch $0 {
            case .none:
              break
            case let .some(e):
              print(e.localizedDescription)
              break
            }
          }
        }
        dg.notify(queue: .main) {
          presenter()
        }
      }
      deleteCloset()
    }
    func presenter() {
      nc?.popToRootViewController(animated: true)
    }
    func presenterError(code: Int) {
      bbi_done.isEnabled = true
      v_state.setState(with: .error, isAnimation: false)
    }
    interactor()
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: AGView, action: Any, tag: Int) {
    switch view {
    case is StateView:
      if let state = action as? StateView.State {
        switch state {
        case .hidden:
          break
        case .loading:
          break
        case .noResults:
          break
        case .noConnection:
          break
        case .error:
          v_state.setState(with: .hidden)
        }
      }
    default:
      break
    }
  }
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    bbi_done.isEnabled = true
    v_addCloset.isHidden = true
    imgv_addCloset.isHidden = true
    imgv_closet.image = image
  }
  
  func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
