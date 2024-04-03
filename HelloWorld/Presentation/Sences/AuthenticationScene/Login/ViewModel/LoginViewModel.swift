import Foundation

struct LoginViewModelActions {
    let showRegisterScreen: () -> Void
    let showAuthorizedScreen: (Bool) -> Void
}

protocol LoginViewModelInput {
    func showRegisterScreen()
    func submit()
}

protocol LoginViewModelOutput {
    
}

final class LoginViewModel:ViewModel, LoginViewModelInput, LoginViewModelOutput {
    
    private let actions: LoginViewModelActions?
    
    // MARK: - Output
    
    
    // MARK: - Init
    init(actions: LoginViewModelActions?) {
        self.actions = actions
    }
    
}

// MARK: - Input
extension LoginViewModel {
    func showRegisterScreen() {
        actions?.showRegisterScreen()
    }
    
    func submit() {
        actions?.showAuthorizedScreen(true)
    }
}
