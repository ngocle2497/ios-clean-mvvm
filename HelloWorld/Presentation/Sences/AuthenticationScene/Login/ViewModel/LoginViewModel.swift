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
    
    private var priorTask: Task<String, Error>?
    private var reurnValue: String = ""
    // MARK: - Output
    
    
    // MARK: - Init
    init(actions: LoginViewModelActions?) {
        self.actions = actions
    }
    
}

// MARK: - Input
extension LoginViewModel {
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    func runTask() async throws -> String {
        if let priorTask {
            return try await priorTask.value
        }
        let task = Task {
            try await mockCallAPI(value: 13)
        }
        self.priorTask = task
        self.reurnValue = randomString(length: 10)
        return try await withTaskCancellationHandler {
            let value  = try await task.value
            self.priorTask = nil
            return value
        } onCancel: {
            task.cancel()
        }
        
    }
    
    private func mockCallAPI(value: Int) async throws -> String {
        try await Task.sleep(nanoseconds: 3000000000)
        return self.reurnValue
    }
    
    func showRegisterScreen() {
//        Task {
//            let value = try await  runTask()
//            print("Show time \(value)")
//        }
                actions?.showRegisterScreen()
    }
    
    func submit() {
        actions?.showAuthorizedScreen(true)
    }

}
