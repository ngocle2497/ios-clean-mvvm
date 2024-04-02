import Foundation
import RxSwift

protocol UserUseCase {
    func getUsers(completion: @escaping (UsersPage) -> Void) -> Void
}

final class UserUseCaseImpl: UserUseCase {
    private let userRepository: UserRepository
    var disposeBag = DisposeBag()
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getUsers(completion: @escaping (UsersPage) -> Void) {
        Task {
            let response = await userRepository.getUserList()
            switch response {
            case .success(let res):
                completion(res.data.toDomain())
            case .failure(let error):
                print(error.message)
            }
        }
    }

}
