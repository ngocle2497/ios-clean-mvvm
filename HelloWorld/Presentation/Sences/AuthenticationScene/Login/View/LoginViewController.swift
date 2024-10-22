import UIKit

class LoginViewController: ViewController<LoginViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    static func create(with viewModel: LoginViewModel) -> LoginViewController {
        return LoginViewController(vm: viewModel)
    }
    
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        vm.submit()
    }
    
    @IBAction func onRegisterButtonPressed(_ sender: Any) {
        vm.showRegisterScreen()
    }
}
