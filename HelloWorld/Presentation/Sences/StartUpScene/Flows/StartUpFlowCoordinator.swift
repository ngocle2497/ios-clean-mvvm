import Foundation
import UIKit

protocol StartUpFlowCoordinatorDependencies {
    func makeSplashViewController(actions: SplashViewModelActions) -> SplashViewController
    
    func makeOnboardingViewController(actions: OnboardingViewModelActions) -> OnboardingViewController
}

final class StartUpFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: StartUpFlowCoordinatorDependencies
    
    
    init(navigationController: UINavigationController?, dependencies: StartUpFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = SplashViewModelActions(showOnboardingScreen: showOnboardingScreen, showAuthenticationScreen: showAuthenticationScreen, showAuthorizedScreen: showAuthorizedScreen)
        let vc = dependencies.makeSplashViewController(actions: actions)

        navigationController?.setViewControllers([vc], animated: true)
    }
    
    private func showOnboardingScreen() {
        let actions = OnboardingViewModelActions(showAuthenticationScreen: showAuthenticationScreen)
        let vc = dependencies.makeOnboardingViewController(actions: actions)
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    private func showAuthenticationScreen(_ animated: Bool) {
        let authenticationSceneDI =  AuthenticationDIContainer()
        let flow = authenticationSceneDI.makeAuthenticationSceneFlowCoordinator(navigationController: navigationController)
        flow.start(animated: animated)
    }
    
    private func showAuthorizedScreen(_ animated: Bool) {
        let authorizedSceneDI =  AuthorizedSceneDIContainer()
        let flow = authorizedSceneDI.makeAuthorizedSceneFlowCoordinator(navigationController: navigationController)
        flow.start(animated: animated)
    }
}
