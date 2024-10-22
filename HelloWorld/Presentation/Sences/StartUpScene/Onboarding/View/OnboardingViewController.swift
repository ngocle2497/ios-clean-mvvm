import UIKit

class OnboardingViewController: ViewController<OnboardingViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModel: OnboardingViewModel) -> OnboardingViewController {
        let vc = OnboardingViewController(vm: viewModel)
        return vc
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        vm.saveConfigOnboardingShown()
    }

}
