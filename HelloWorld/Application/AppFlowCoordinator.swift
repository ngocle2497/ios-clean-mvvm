import Foundation
import UIKit

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    var appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let startUpSceneDIConatiner = appDIContainer.makeStartUpSceneDIContainer()
        let flow = startUpSceneDIConatiner.makeStartUpSceneFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
