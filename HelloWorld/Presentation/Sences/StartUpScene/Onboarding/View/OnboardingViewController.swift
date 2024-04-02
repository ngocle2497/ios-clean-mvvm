import UIKit

class OnboardingViewController: ViewController<OnboardingViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModal: OnboardingViewModel) -> OnboardingViewController {
        let vc = OnboardingViewController(vm: viewModal)
        return vc
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        vm.saveConfigOnboardingShown()
    }

}
