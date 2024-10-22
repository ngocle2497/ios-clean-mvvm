import Foundation

struct SplashViewModelActions {
    let showOnboardingScreen: () -> Void
    let showAuthenticationScreen: (Bool) -> Void
    let showAuthorizedScreen: (Bool) -> Void
}

protocol SplashViewModelInput {
    func getConfig()
    func showNextScreen()
}

protocol SplashViewModelOutput {
    
}

final class SplashViewModel: ViewModel, SplashViewModelInput, SplashViewModelOutput {
    
    private let actions: SplashViewModelActions?
    
    // MARK: - Output
    
    
    // MARK: - Init
    init(actions: SplashViewModelActions?) {
        self.actions = actions
    }
    
}

// MARK: - Input
extension SplashViewModel {
    func getConfig() {
        // TODO: get config, push event to View, View call showNextScreen
        
    }
    
    func showNextScreen() {
        if LOCAL_STORAGE.onboardingShown {
            if LOCAL_STORAGE.appToken != nil {
                actions?.showAuthorizedScreen(false)
            } else {
                actions?.showAuthenticationScreen(false)
            }
        } else {
            actions?.showOnboardingScreen()
        }
    }
}
