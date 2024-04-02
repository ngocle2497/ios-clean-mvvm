import Foundation
import RxSwift

protocol UserRepository {
    func getUserList()  async -> RequestResult<UserResponseDTO>
}
