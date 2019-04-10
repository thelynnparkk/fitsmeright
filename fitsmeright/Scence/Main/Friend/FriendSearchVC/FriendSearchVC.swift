//
//  FriendSearchVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 26/3/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift


import FirebaseStorage
import FirebaseFirestore



extension FriendSearchVC:
  UITextFieldDelegate
{
  
}



class FriendSearchVC: AGVC {
  
  //MARK: - Instantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_username: UILabel!
  @IBOutlet weak var v_username: UIView!
  @IBOutlet weak var txt_username: UITextField!
  @IBOutlet weak var btn_search: UIButton!
  @IBOutlet weak var v_friend: UIView!
  @IBOutlet weak var imgv_friend: UIImageView!
  @IBOutlet weak var lb_friend: UILabel!
  @IBOutlet weak var btn_addFriend: UIButton!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsUser: FSUser?
  var fsRelationship: FSRelationship?
  
  
  
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
  
  
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Core
    
    
    
    //MARK: Component
    view.setupViewFrame()
    setupFormTextField(label: lb_username, view: v_username, textField: txt_username)
    txt_username.setupUsername()
    txt_username.returnKeyType = .search
    txt_username.delegate = self
    
    btn_search.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    imgv_friend.contentMode = .scaleAspectFit
    imgv_friend.backgroundColor = c_material.grey200
    imgv_friend.clipsToBounds = true
    imgv_friend.kf.indicatorType = .activity
    imgv_friend.cornerRadius = imgv_friend.frame.width / 2
    
    lb_friend.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    lb_friend.textColor = .black
    
    btn_addFriend.clipsToBounds = true
    btn_addFriend.backgroundColor = c_custom.peach
    btn_addFriend.setImage(#imageLiteral(resourceName: "plus"), for: [])
    btn_addFriend.cornerRadius = btn_addFriend.frame.width / 2
    btn_addFriend.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    
    
    //MARK: Other
    
    
    
    //MARK: Snp
    
    
    
    //MARK: Localize
    setupLocalize()
    
    
    
    //MARK: Data
    prepareSearch()
  }
  
  
  
  //MARK: - SetupView
  
  
  
  //MARK: - SetupData
  
  
  
  //MARK: - Event
  @objc func buttonPressed(_ sender: UIButton) {
    switch sender {
    case btn_addFriend:
      addRelation()
    case btn_search:
      fetchUser()
    default:
      break
    }
  }
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = "Add new friend"
    lb_username.text = "Add a friend by username"
    txt_username.placeholder = "username"
    txt_username.setPlaceHolderTextColor(c_material.grey500)
  }
  
  
  
  //MARK: - Private
  private func setupFormTextField(label: UILabel, view: UIView, textField: UITextField) {
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    
    view.layer.borderColor = c_material.grey500.cgColor
    view.layer.borderWidth = 1
    view.layer.cornerRadius = view.frame.size.height / 2
    view.backgroundColor = .white
    
    textField.textColor = c_custom.peach
  }
  
  private func prepareSearch() {
    v_friend.isHidden = true
    btn_addFriend.isHidden = true
    fsUser = nil
    fsRelationship = nil
  }
  
  
  
  
  //MARK: - VIP - FetchUser
  func fetchUser() {
    func interactor() {
      guard let username = txt_username.text else {
        presenterError(code: 0)
        return
      }
      worker(username: username)
    }
    func worker(username: String) {
      func getUser() {
        FSUserWorker.get(username: username) { [weak self] in
          guard let _s = self else { return }
          switch $0.error {
          case .none:
            _s.fsUser = $0.data
            getRelation()
          case let .some(e):
            presenterError(code: 1)
            print(e.localizedDescription)
          }
        }
      }
      func getRelation() {
        guard let fsUserResponse = fsUser, let fsUserRequest = UserDefaults.FSUserDefault.get() else {
          presenterError(code: 1)
          return
        }
        FSRelationshipWorker.get(userOneId: fsUserRequest._documentId, userTwoId: fsUserResponse._documentId) {  [weak self] in
          guard let _s = self else { return }
          switch $0.error {
          case .none:
            _s.fsRelationship = $0.data
            presenter()
          case .some:
            presenter()
          }
        }
      }
      getUser()
    }
    func presenter() {
      lb_friend.text = fsUser?.displayName
      imgv_friend.kf.setImage(with: fsUser?.imageURL)
      if fsUser?.documentId == UserDefaults.FSUserDefault.get()?.documentId {
        btn_addFriend.isHidden = true
      } else if let _ = fsRelationship {
        btn_addFriend.isHidden = true
      } else {
        btn_addFriend.isHidden = false
      }
      v_friend.isHidden = false
    }
    func presenterError(code: Int) {
      switch code {
      case 0:
        break
      default:
        break
      }
    }
    interactor()
  }
  
  //MARK: - VIP - AddRelation
  func addRelation() {
    func interactor() {
      btn_addFriend.isEnabled = false
      worker()
    }
    func worker() {
      let fsRelationship = FSRelationship()
      fsRelationship.userOneId = UserDefaults.FSUserDefault.get()?.documentId
      fsRelationship.userTwoId = fsUser?.documentId
      fsRelationship.status = UserRelationStatus.request.rawValue
      fsRelationship.updatedAt = Timestamp(date: Date())
      FSRelationshipWorker.add(fsRelationship: fsRelationship) {
        switch $0.error {
        case .none:
          presenter()
        case let .some(e):
          presenterError()
          print(e.localizedDescription)
        }
      }
    }
    func presenter() {
      btn_addFriend.isHidden = true
    }
    func presenterError() {
      btn_addFriend.isEnabled = true
    }
    interactor()
  }
  
  
  
  //MARK: - Core - UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    fetchUser()
    return true
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pod - Protocol
  
  
  
}



