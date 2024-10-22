import UIKit

class HomeViewController: ViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let vc =  HomeViewController(vm: viewModel)
        return vc
    }
    @IBAction func onLogoutButtonPressed(_ sender: Any) {
        vm.logout()
    }
}
