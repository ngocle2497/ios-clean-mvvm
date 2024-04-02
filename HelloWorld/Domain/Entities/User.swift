import Foundation

struct User {
    enum Gender {
        case male
        case female
    }
    let id: String
    let gender: Gender?
    let name: String?
    let email: String?
}

struct UsersPage {
    let page: Int
    let totalPage: Int
    let users: [User]
}
