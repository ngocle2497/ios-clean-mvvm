import UIKit

class RegisterViewController: ViewController<RegisterViewModel>, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

    }

    static func create(with viewModel: RegisterViewModel) -> RegisterViewController {
        let vc = RegisterViewController(vm: viewModel)
        return vc
    }

    @IBAction func onBackButtonPressed(_ sender: Any) {
        vm.popToLogin()
    }
}
