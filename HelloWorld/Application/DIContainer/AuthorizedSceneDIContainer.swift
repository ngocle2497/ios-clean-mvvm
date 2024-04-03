import Foundation
import UIKit

final class AuthorizedSceneDIContainer: AuthorizedFlowCoordinatorDependencies {
    
    // MARK: - Home
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
    
    private func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
        return HomeViewModel(actions: actions)
    }
    
    // MARK: - Flow
    func makeAuthorizedSceneFlowCoordinator(navigationController: UINavigationController?) -> AuthorizedFlowCoordinator {
        return AuthorizedFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
