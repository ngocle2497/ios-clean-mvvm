import UIKit

class SplashViewController: ViewController<SplashViewModel> {

    
    @IBOutlet weak var iconSplashImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getConfig()
        hideSplash()
    }

    static func create(with viewModel: SplashViewModel) -> SplashViewController{
        return SplashViewController(vm: viewModel)
    }
    
    private func hideSplash() {
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.iconSplashImageView.transform = CGAffineTransform.identity.translatedBy(x: 200, y: -200).scaledBy(x: 0.4, y: 0.4)
            self.iconSplashImageView.alpha = 0
        } completion: { finished in
            if finished {
                self.vm.showNextScreen()
            }
        }
    }
}
