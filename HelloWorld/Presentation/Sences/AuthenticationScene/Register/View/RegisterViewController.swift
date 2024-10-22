import UIKit

class RegisterViewController: ViewController<RegisterViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func create(with viewModel: RegisterViewModel) -> RegisterViewController {
        return RegisterViewController(vm: viewModel)
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        vm.popToLogin()
    }
}
