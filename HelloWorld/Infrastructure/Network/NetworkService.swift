import Foundation
import RxSwift
import Moya
import Alamofire

struct BaseError: Error {
    let code: Int
    let message: String
}

struct HTTPResponseError: Error {
    let error: Response
}

class ResponseBase<T: Codable> {
    let code: Int
    let data: T
    
    init(code: Int, data: T) {
        self.code = code
        self.data = data
    }
}

enum RequestResult<T: Codable> {
    case success(ResponseBase<T>)
    case failure(BaseError)
}

class NetworkService {
    
    static func request<T: Codable>(_ route: API, type: T.Type) async -> RequestResult<T>  {
        do {
            let response = try await NetworkManager.shared.getAPIProvider(type: API.self).async.request(route, type: type.self)
            return .success(ResponseBase<T>(code: 200, data: response))
        } catch  {
            guard let error = error as? MoyaError else {
                guard let httpError = error as? HTTPResponseError else {
                    return .failure(.init(code: -100, message: error.localizedDescription))
                }
                
                // Error from request
                return .failure(.init(code: -100, message: httpError.error.description))
            }
            
            return .failure(.init(code: -100, message: error.localizedDescription))
        }
    }
}
