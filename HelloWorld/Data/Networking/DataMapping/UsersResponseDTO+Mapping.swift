import Foundation


// MARK: - Data Tranfer Object
struct UserResponseDTO: Codable {
    let info: Info
    let results: [UserDTO]
}


extension UserResponseDTO {
    struct Info: Codable {
        let seed: String
        let results: Int
        let page: Int
        let version: String
    }
    struct UserDTO: Codable {
        enum Gender: String, Codable {
            case male   = "male"
            case female = "female"
        }
        
        struct Name: Codable {
            let title: String
            let first: String
            let last: String
        }
        
        let phone: String
        let nat: String
        let gender: Gender
        let name: Name
        let email: String
    }
}

// MARK: - Mapping to Domain

extension UserResponseDTO {
    func toDomain() -> UsersPage {
        return .init(page: info.page, totalPage: info.results, users: results.map({ $0.toDomain() }))
    }
}

extension UserResponseDTO.UserDTO {
    func toDomain() -> User {
        return .init(id: nat, gender: gender.toDomain(), name: name.first, email: email)
    }
}

extension UserResponseDTO.UserDTO.Gender {
    func toDomain() -> User.Gender {
        switch self {
        case .male:
            return .male
        case .female:
            return .female
        }
    }
}
