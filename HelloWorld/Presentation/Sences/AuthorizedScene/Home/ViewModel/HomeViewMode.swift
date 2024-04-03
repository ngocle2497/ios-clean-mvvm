import Foundation

struct HomeViewModelActions {
    let logout: () -> Void
}

protocol HomeViewModelInput {
    func logout()
}

protocol HomeViewModelOutput {
    
}

typealias HomeViewModelType = HomeViewModelInput & HomeViewModelOutput

final class HomeViewModel:ViewModel, HomeViewModelType {
    
    private let actions: HomeViewModelActions?
    
    // MARK: - Output
    
    // MARK: - Init
    init(actions: HomeViewModelActions?) {
        self.actions = actions
    }
    
}

// MARK: - Input
extension HomeViewModel {
    func logout() {
        LocalStorage.shared.appToken = nil
        actions?.logout();
    }
}
