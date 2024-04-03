import Foundation
import UIKit

protocol AuthorizedFlowCoordinatorDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
}

final class AuthorizedFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: AuthorizedFlowCoordinatorDependencies
    
    
    init(navigationController: UINavigationController?, dependencies: AuthorizedFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start(animated: Bool) {
        let actions = HomeViewModelActions(logout: logout)
        let vc = dependencies.makeHomeViewController(actions: actions)

        navigationController?.setViewControllers([vc], animated: animated)
    }
    
    private func logout() {
        let container = AuthenticationDIContainer()
        let flow = container.makeAuthenticationSceneFlowCoordinator(navigationController: navigationController)
        flow.start(animated: true)
    }
}
