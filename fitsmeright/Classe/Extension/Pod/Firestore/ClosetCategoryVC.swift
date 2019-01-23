//
//  ClosetCategoryVC.swift
//  fitsmeright
//
//  Created by Lynn Park on 22/1/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import UIKit



extension ClosetCategoryVC:
  AGVCInstantiatable,
  AGViewDelegate,
  StateViewDelegate
{
  
}



class ClosetCategoryVC: AGVC {
  //MARK: - AGVCInstantiatable
  
  
  
  //MARK: - Enum
  
  
  
  //MARK: - UI
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var imgv_background: UIImageView!
  @IBOutlet weak var v_closet: UIView!
  @IBOutlet weak var v_dress: ClosetMenuView!
  @IBOutlet weak var v_jacket: ClosetMenuView!
  @IBOutlet weak var v_hat: ClosetMenuView!
  @IBOutlet weak var v_accessory: ClosetMenuView!
  @IBOutlet weak var v_bag: ClosetMenuView!
  @IBOutlet weak var v_shoe: ClosetMenuView!
  @IBOutlet weak var v_top: ClosetMenuView!
  @IBOutlet weak var v_bottom: ClosetMenuView!
  @IBOutlet weak var v_sock: ClosetMenuView!
  var v_state: StateView!
  
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var fsClosets: [FSCloset] = []
  
  
  
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
    v_closet.alpha = 0
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
    
    
    
    //MARK: Component
    v_dress.delegate = self
    v_jacket.delegate = self
    v_hat.delegate = self
    v_accessory.delegate = self
    v_bag.delegate = self
    v_shoe.delegate = self
    v_top.delegate = self
    v_bottom.delegate = self
    v_sock.delegate = self
    
    v_state = StateView(viewModel: StateView.light, axis: .vertical)
    v_state.delegate = self
    view.addSubview(v_state)
    
    prepare()
    
    
    
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
    
    
    
  }
  
  override func setupViewOnDidLayoutSubviews() {
    
  }
  
  
  
  //MARK: - Setup Data
  override func setupDataOnViewDidLoad() {
    fetchClosetMenus()
  }
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  override func setupLocalize() {
    ni.title = ClosetCategoryVC.sb_name
    lb_title.text = ClosetCategoryVC.sb_name
  }
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - FetchClosetMenus
  func fetchClosetMenus() {
    
    func interactor() {
//      v_state.setState(with: .loading, isAnimation: false)
      worker()
    }
    
    func worker() {
      FSClosetWorker.fetch { [weak self] in
        guard let _s = self else { return }
        switch $0.error {
        case .none:
          _s.fsClosets = $0.data
          present($0.data)
        case let .some(e):
          presentError(e)
        }
      }
    }
    
    func present(_ response: [FSCloset]) {
//      v_state.setState(with: .hidden)
      var closet_dress: [FSCloset] = []
      var closet_jacket: [FSCloset] = []
      var closet_hat: [FSCloset] = []
      var closet_accessory: [FSCloset] = []
      var closet_bag: [FSCloset] = []
      var closet_shoe: [FSCloset] = []
      var closet_top: [FSCloset] = []
      var closet_bottom: [FSCloset] = []
      var closet_sock: [FSCloset] = []
      for i in response {
        switch i.closetCategory {
        case .dress:
          closet_dress.append(i)
        case .jacket:
          closet_jacket.append(i)
        case .hat:
          closet_hat.append(i)
        case .accessory:
          closet_accessory.append(i)
        case .bag:
          closet_bag.append(i)
        case .shoe:
          closet_shoe.append(i)
        case .top:
          closet_top.append(i)
        case .bottom:
          closet_bottom.append(i)
        case .sock:
          closet_sock.append(i)
        }
      }
      v_dress.setup(title: "\(closet_dress.count) \(ClosetCategory.dress.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_dress").filled(withColor: UIColor.Custom.peach))
      v_jacket.setup(title: "\(closet_jacket.count) \(ClosetCategory.jacket.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_jacket").filled(withColor: UIColor.Custom.peach))
      v_hat.setup(title: "\(closet_hat.count) \(ClosetCategory.hat.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_hat").filled(withColor: UIColor.Custom.peach))
      v_accessory.setup(title: "\(closet_accessory.count) \(ClosetCategory.accessory.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_accessory").filled(withColor: UIColor.Custom.peach))
      v_bag.setup(title: "\(closet_bag.count) \(ClosetCategory.bag.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_bag").filled(withColor: UIColor.Custom.peach))
      v_shoe.setup(title: "\(closet_shoe.count) \(ClosetCategory.shoe.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_shoe").filled(withColor: UIColor.Custom.peach))
      v_top.setup(title: "\(closet_top.count) \(ClosetCategory.top.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_top").filled(withColor: UIColor.Custom.peach))
      v_bottom.setup(title: "\(closet_bottom.count) \(ClosetCategory.bottom.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_bottom").filled(withColor: UIColor.Custom.peach))
      v_sock.setup(title: "\(closet_sock.count) \(ClosetCategory.sock.plural)", image: #imageLiteral(resourceName: "ic_closetmenu_sock").filled(withColor: UIColor.Custom.peach))
      v_closet.fadeIn(duration: 0.3, completion: nil)
    }
    
    func presentError(_ error: Error) {
//      v_state.setState(with: .error, isAnimation: false)
      print(error.localizedDescription)
    }
    
    interactor()
    
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGViewDelegate
  func agViewPressed(_ view: UIView) {
    var category = ClosetCategory.default
    switch view {
    case v_dress:
      category = .dress
    case v_jacket:
      category = .jacket
    case v_hat:
      category = .hat
    case v_accessory:
      category = .accessory
    case v_bag:
      category = .bag
    case v_shoe:
      category = .shoe
    case v_top:
      category = .top
    case v_bottom:
      category = .bottom
    case v_sock:
      category = .sock
    default:
      return
    }
    let vc = ClosetVC.vc
    vc.fsClosets = fsClosets.filter({ $0.closetCategory == category })
    vc.closetCategory = category
    navigationController?.pushViewController(vc)
  }
  
  
  
  //MARK: - Custom - StateViewDelegate
  func stateViewPressed(with stateView: StateView , state: StateView.State) {
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
      break
    }
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
