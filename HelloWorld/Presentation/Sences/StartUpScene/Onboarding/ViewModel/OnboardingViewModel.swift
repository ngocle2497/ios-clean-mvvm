import Foundation
import RxSwift
import RxCocoa

struct OnboardingViewModelActions {
    let showAuthenticationScreen: (Bool) -> Void
}

protocol OnboardingViewModelInput {
    func saveConfigOnboardingShown()
}

protocol OnboardingViewModelOutput {
    
}

final class OnboardingViewModel: ViewModel, OnboardingViewModelInput, OnboardingViewModelOutput {
    
    private let actions: OnboardingViewModelActions?
    
    init(actions: OnboardingViewModelActions?) {
        self.actions = actions
    }
    
}

extension OnboardingViewModel {
    // MARK: - Input
    func saveConfigOnboardingShown() {
        // TODO: Save config Onboarding screen shown.
        LocalStorage.shared.onboardingShown = true
        actions?.showAuthenticationScreen(true)
    }
}
