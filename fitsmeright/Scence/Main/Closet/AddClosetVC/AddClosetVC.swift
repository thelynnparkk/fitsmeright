//
//  AddClosetVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit
import FirebaseStorage



extension AddClosetVC:
  AGVCInstantiatable
{
  
}



class AddClosetVC: AGIPC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
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
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Apperance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  
  
  //MARK: - Life cycle
  override func onInit() {
    super.onInit()
    
  }
  
  override func prepare() {
    super.prepare()
    
  }
  
  override func prepareToDeinit() {
    super.prepareToDeinit()
    
  }
  
  override func onDeinit() {
    super.onDeinit()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  
  //MARK: - Setup View
  override func setupViewOnViewDidLoad() {
    //MARK: Core
    //    nb?.setupWith(content: .white, bg: c.peach, isTranslucent: false)
    bbi_done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addClosetPressed))
    ni.rightBarButtonItems = [bbi_done]
    
    
    
    //MARK: Component
    sv_container.setupScrollVertical()
    imgv_closet.contentMode = .scaleAspectFit
    imgv_addCloset.image = UIImage(color: c_custom.peach, size: .less)
    imgv_addCloset.contentMode = .scaleAspectFit
    v_seperator.backgroundColor = c_material.grey300
    btn_chooseCloset.addTarget(self, action: #selector(chooseClosetPressed), for: .touchUpInside)
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchCloset()
  }
  
  
  
  //MARK: - Event
  @IBAction func chooseClosetPressed(_ sender: Any) {
    displayImagePickerAlert()
  }
  
  @IBAction func addClosetPressed(_ sender: Any) {
    if let _ = closetCategory, let _ = fsCloset {
      updateCloset()
    } else {
      addCloset()
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = AddClosetVC.sb_name
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
        imgv_closet.download(from: imageURL, contentMode: .scaleAspectFit, placeholder: nil)
      } else {
        imgv_closet.image = nil
      }
      imgv_addCloset.isHidden = true
      let vm_brand = ClosetFormViewUC.ViewModel()
      vm_brand.displayedForm.key = "Brand"
      vm_brand.displayedForm.placeHolder = "Add Brand"
      vm_brand.displayedForm.value = fsCloset!._brand
      let vm_price = ClosetFormViewUC.ViewModel()
      vm_price.displayedForm.key = "Price"
      vm_price.displayedForm.placeHolder = "Add Price"
      vm_price.displayedForm.value = "\(fsCloset!._price)"
      let vm_size = ClosetFormViewUC.ViewModel()
      vm_size.displayedForm.key = "Size"
      vm_size.displayedForm.placeHolder = "Add Size"
      vm_size.displayedForm.value = fsCloset!._size
      let vm_place = ClosetFormViewUC.ViewModel()
      vm_place.displayedForm.key = "Place"
      vm_place.displayedForm.placeHolder = "Add Place"
      vm_place.displayedForm.value = fsCloset!._place
      v_brand.setupData(with: vm_brand)
      v_price.setupData(with: vm_price)
      v_size.setupData(with: vm_size)
      v_place.setupData(with: vm_place)
    }
    
    func presentAdd() {
      ni.title = closetCategory!.name.uppercased()
      let vm_brand = ClosetFormViewUC.ViewModel()
      vm_brand.displayedForm.key = "Brand"
      vm_brand.displayedForm.placeHolder = "Add Brand"
      let vm_price = ClosetFormViewUC.ViewModel()
      vm_price.displayedForm.key = "Price"
      vm_price.displayedForm.placeHolder = "Add Price"
      let vm_size = ClosetFormViewUC.ViewModel()
      vm_size.displayedForm.key = "Size"
      vm_size.displayedForm.placeHolder = "Add Size"
      let vm_place = ClosetFormViewUC.ViewModel()
      vm_place.displayedForm.key = "Place"
      vm_place.displayedForm.placeHolder = "Add Place"
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
      fsCloset.updatedAt = Date().toString()
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
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  public override func didFinishPickingMedia(_ picker: UIImagePickerController, image: UIImage) {
    picker.dismiss(animated: true, completion: nil)
    bbi_done.isEnabled = true
    imgv_addCloset.isHidden = true
    imgv_closet.image = image
  }
  
  public override func didFinishPickingMediaError(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  public override func didCancelPickingMedia(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
