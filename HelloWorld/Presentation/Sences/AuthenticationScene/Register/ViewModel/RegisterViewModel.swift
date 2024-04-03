import Foundation

struct RegisterViewModelActions {
    let popToLogin: () -> Void
}

protocol RegisterViewModelInput {
    func popToLogin()
}

protocol RegisterViewModelOutput {
    
}

final class RegisterViewModel: ViewModel, RegisterViewModelInput, RegisterViewModelOutput {
    private let actions: RegisterViewModelActions?
    
    // MARK: - Output
    
    
    // MARK: - Init
    init(actions: RegisterViewModelActions) {
        self.actions = actions
    }
    

}

// MARK: - Input
extension RegisterViewModel {
    func popToLogin() {
        actions?.popToLogin()
    }
}
