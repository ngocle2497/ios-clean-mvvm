import Foundation
import RxSwift

final class UserRepositoriesImpl {
    
}

extension UserRepositoriesImpl: UserRepository {
    func getUserList() async -> RequestResult<UserResponseDTO> {
        return await NetworkService.request(.users, type: UserResponseDTO.self)
    }
}
