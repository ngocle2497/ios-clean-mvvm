import UIKit

class LoginViewController: ViewController<LoginViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    static func create(with viewModal: LoginViewModel) -> LoginViewController {
        let vc =  LoginViewController(vm: viewModal)
        return vc
    }
    
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        vm.submit()
    }
    
    @IBAction func onRegisterButtonPressed(_ sender: Any) {
        vm.showRegisterScreen()
    }
}
