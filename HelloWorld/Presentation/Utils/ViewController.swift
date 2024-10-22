import Foundation
import UIKit
import RxSwift

class ViewController<VM: ViewModel>: UIViewController, UIGestureRecognizerDelegate {
     
    private let viewModel: VM!
    
    let disposeBag = DisposeBag()

    var vm: VM {
        get {
            return viewModel
        }
    }
    
    var statusBarStyle: UIStatusBarStyle = .darkContent {
        didSet {
            self.updateStatusBar()
        }
    }
    
    var screenOrientations: UIInterfaceOrientationMask = .portrait {
        didSet {
            if #available(iOS 16.0, *) {
                self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
            } else {
                UIDevice.current.setValue(screenOrientations, forKey: "orientation")
            }
        }
    }

    var getureEnabled = true {
        didSet {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = getureEnabled
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask  {
        get {
            return screenOrientations
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return statusBarStyle
        }
    }

    required init(vm: VM, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        viewModel = vm
        let resourceName = nibNameOrNil ?? String(describing: Self.self)
        if Bundle.main.path(forResource: resourceName, ofType: "xib") == nil {
            super.init(nibName: nil, bundle: nil)
        } else {
            super.init(nibName: resourceName, bundle: nibBundleOrNil)
        }
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        screenOrientations = .portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStatusBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setup()
        setupRx()
    }
    
    // MARK: - Private ==============
    private func updateStatusBar() {
        UIView.animate(withDuration: 0.3) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    // MARK: - Public ==============
    func setup() {
        GLOBAL_SETTING.theme.subscribe(with: self) { vc, _ in
            vc.themeUpdate()
        }.disposed(by: disposeBag)
        
        GLOBAL_SETTING.language.subscribe(with: self) { vc, _ in
            vc.languageUpdate()
        }.disposed(by: disposeBag)
        
        GLOBAL_SETTING.fontSize.subscribe(with: self) { vc, _ in
            vc.fontSizeUpdate()
        }.disposed(by: disposeBag)
    }
    
    func setupView() {
        
    }
    
    func setupText() {
        
    }
    
    func setupRx() {
        
    }
    
    func fontSizeUpdate() {
        setupText()
    }
    
    func languageUpdate() {
        setupText()
    }
    
    func themeUpdate() {
        setupView()
    }
}

class ViewModel {
    private(set) var disposeBag = DisposeBag()
    
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
