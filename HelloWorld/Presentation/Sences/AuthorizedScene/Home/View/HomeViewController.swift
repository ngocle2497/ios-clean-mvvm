import UIKit

class HomeViewController: ViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModal: HomeViewModel) -> HomeViewController {
        let vc =  HomeViewController(vm: viewModal)
        return vc
    }
    @IBAction func onLogoutButtonPressed(_ sender: Any) {
        vm.logout()
    }
}
