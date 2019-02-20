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
  UITextFieldDelegate
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
  @IBOutlet weak var sv_container: UIScrollView!
  @IBOutlet weak var imgv_closet: UIImageView!
  @IBOutlet weak var imgv_addCloset: UIImageView!
  @IBOutlet weak var btn_chooseCloset: UIButton!
  @IBOutlet weak var v_seperator: UIView!
  @IBOutlet weak var v_brand: ClosetFormView!
  @IBOutlet weak var v_price: ClosetFormView!
  @IBOutlet weak var v_size: ClosetFormView!
  @IBOutlet weak var v_place: ClosetFormView!
  
  
  
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
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBarButtonPressed))
    ni.rightBarButtonItems = [bbi_done]
    
    
    
    //MARK: Component
    sv_container.setupScrollVertical()
    imgv_closet.contentMode = .scaleAspectFill
    imgv_addCloset.image = UIImage(color: c_custom.peach, size: .less)
    imgv_addCloset.contentMode = .scaleAspectFit
    v_seperator.backgroundColor = c_material.grey300
    btn_chooseCloset.addTarget(self, action: #selector(chooseClosetPressed), for: .touchUpInside)
    
    v_brand.txt_value.delegate = self
    v_price.txt_value.delegate = self
    v_size.txt_value.delegate = self
    v_place.txt_value.delegate = self
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    fetchCloset()
  }
  
  
  
  //MARK: - Setup View
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  @objc
  func test(_ sender: UITextField) {
    print("test")
  }
  
  @IBAction func chooseClosetPressed(_ sender: Any) {
    displayImagePickerPopup()
  }
  
  @IBAction func doneBarButtonPressed(_ sender: Any) {
    if let _ = closetCategory, let _ = fsCloset {
      updateCloset()
    } else {
      addCloset()
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetFormVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchCloset
  func fetchCloset() {
    
    func interactor() {
      if let _ = closetCategory, let _ = fsCloset {
        worker()
      } else {
        presentAdd()
      }
    }
    
    func worker() {
      presentEdit()
    }
    
    func presentEdit() {
      ni.title = closetCategory!.name.uppercased()
      if let imageURL = fsCloset!.imageURL {
        imgv_closet.kf.setImage(with: imageURL, placeholder: nil, options: nil)
      } else {
        imgv_closet.image = nil
      }
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
      let vm_place = ClosetFormViewDisplayed()
      vm_place.key = "Place"
      vm_place.placeHolder = "Add Place"
      vm_place.value = fsCloset!._place
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      v_place.setupData(with: vm_place)
    }
    
    func presentAdd() {
      ni.title = closetCategory!.name.uppercased()
      let vm_brand = ClosetFormViewDisplayed()
      vm_brand.key = "Brand"
      vm_brand.placeHolder = "Add Brand"
      let vm_price = ClosetFormViewDisplayed()
      vm_price.key = "Price"
      vm_price.placeHolder = "Add Price"
      let vm_size = ClosetFormViewDisplayed()
      vm_size.key = "Size"
      vm_size.placeHolder = "Add Size"
      let vm_place = ClosetFormViewDisplayed()
      vm_place.key = "Place"
      vm_place.placeHolder = "Add Place"
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      v_place.setupData(with: vm_place)
      bbi_done.isEnabled = false
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - VIP - AddCloset
  func addCloset() {
    
    func interactor() {
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      let fsCloset = FSCloset()
      fsCloset.userId = fsUser._documentId
      fsCloset.category = closetCategory?.rawValue
      fsCloset.image = ""
      fsCloset.price = v_price.txt_value.text?.int ?? 0
      fsCloset.brand = v_brand.txt_value.text
      fsCloset.place = v_place.txt_value.text
      fsCloset.size = v_size.txt_value.text
      fsCloset.updatedAt = Timestamp(date: Date())
      worker(fsCloset: fsCloset)
    }
    
    func worker(fsCloset: FSCloset) {
      
      func uploadClosetImage() {
        guard let data = imgv_closet.image?.jpegData(compressionQuality: 1) else {
          presentError()
          return
        }
        let ref_folder = Storage.storage().reference(withPath: SCloset.folder)
        let ref_create = ref_folder.child("\(Date().millisecondsSince1970).jpg")
        ref_create.putData(data, metadata: nil) { (metadata, error) in
          if let e = error {
            presentError(error: e)
            return
          }
          guard let _ = metadata else {
            presentError()
            return
          }
          ref_create.downloadURL { (url, error) in
            if let e = error {
              presentError(error: e)
              return
            }
            guard let url = url else {
              presentError()
              return
            }
            fsCloset.image = url.absoluteString
            addCloset()
          }
        }
      }
      
      func addCloset() {
          FSClosetWorker.add(fsCloset: fsCloset) {
          switch $0 {
          case .none:
            present()
          case let .some(e):
            presentError(error: e)
          }
        }
      }
      
      uploadClosetImage()
      
    }
    
    func present() {
      navigationController?.popToRootViewController(animated: true)
    }
    
    func presentError() {
      
    }
    
    func presentError(error: Error) {
      print(error.localizedDescription)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - VIP - UpdateCloset
  func updateCloset() {
    
    func interactor() {
      let fsUser = FMUserDefaults.FSUserDefault.get()!
      let fsCloset = FSCloset()
      fsCloset.documentId = self.fsCloset?._documentId
      fsCloset.userId = fsUser._documentId
      fsCloset.category = closetCategory?.rawValue
      fsCloset.image = ""
      fsCloset.price = v_price.txt_value.text?.int ?? 0
      fsCloset.brand = v_brand.txt_value.text
      fsCloset.place = v_place.txt_value.text
      fsCloset.size = v_size.txt_value.text
      fsCloset.updatedAt = Timestamp(date: Date())
      worker(fsCloset: fsCloset)
    }
    
    func worker(fsCloset: FSCloset) {
      
      func uploadClosetImage() {
        guard let data = imgv_closet.image?.jpegData(compressionQuality: 1) else {
          presentError()
          return
        }
        let ref_folder = Storage.storage().reference(withPath: SCloset.folder)
        let ref_create = ref_folder.child("\(Date().millisecondsSince1970).jpg")
        ref_create.putData(data, metadata: nil) { (metadata, error) in
          if let e = error {
            presentError(error: e)
            return
          }
          guard let _ = metadata else {
            presentError()
            return
          }
          ref_create.downloadURL { (url, error) in
            if let e = error {
              presentError(error: e)
              return
            }
            guard let url = url else {
              presentError()
              return
            }
            let ref_old = Storage.storage().reference(forURL: self.fsCloset!._image)
            ref_old.delete()
            fsCloset.image = url.absoluteString
            updateCloset()
          }
        }
      }
      
      func updateCloset() {
        FSClosetWorker.update(fsCloset: fsCloset) {
          switch $0 {
          case .none:
            present(fsCloset: fsCloset)
          case let .some(e):
            presentError(error: e)
          }
        }
      }
      
      uploadClosetImage()
      
    }
    
    func present(fsCloset: FSCloset) {
      delegate_agvc?.agVCPressed(self, action: Action.update(fsCloset))
    }
    
    func presentError() {
      
    }
    
    func presentError(error: Error) {
      print(error.localizedDescription)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - ViewIPCDelegate
  func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    bbi_done.isEnabled = true
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
