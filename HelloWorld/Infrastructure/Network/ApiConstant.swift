import Foundation
import Moya

enum API {
    case users
    case pushFile
}

extension API: TargetType {
    var baseURL: URL {
        switch self {
        case .users:
            return URL(string: "https://randomuser.me")!
        case .pushFile:
            return URL(string: "https://domain.file.api")!
        }
    }
    
    var path: String {
        switch self {
        case .users:
            return "/api1"
        case .pushFile:
            return "/file"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        let parameters: [String: Any] = [:]
        let encoding: ParameterEncoding = URLEncoding.queryString
        switch self {
        case .users:
            return .requestParameters(parameters: ["results": 2], encoding: encoding)
        case .pushFile:
            return .requestParameters(parameters: parameters, encoding: encoding)
        }
    }
    
    var headers: [String : String]? {
        let defaultHeaders: [String: String] = ["Content-Type": "application/json"]
        switch self {
        case .users:
            return  defaultHeaders
        case .pushFile:
            return ["Content-Type": "multipart/form-data"]
        }
    }
}
