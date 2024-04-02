import Foundation
import Moya
import Alamofire

class APISession {
    typealias NetworkSession = Alamofire.Session
    
    static let session: NetworkSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(60)
        configuration.timeoutIntervalForResource = TimeInterval(60)
        let sessionManager = NetworkSession(configuration: configuration, eventMonitors: [])
        return sessionManager
    }()
}


class NetworkManager {
    static let shared = NetworkManager()
    
    func getAPIProvider<T: TargetType>(type: T.Type) -> MoyaProvider<T> {
        
        let plugins: [PluginType] =  []
        
        return MoyaProvider<T>(session: APISession.session, plugins: plugins)
    }
}

class CachePolicyPlugin: PluginType {
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutableRequest = request
        mutableRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return mutableRequest
    }
}

extension MoyaProvider {
    class MoyaConcurrency {
        private let provider: MoyaProvider
        
        init(provider: MoyaProvider) {
            self.provider = provider
        }
        
        func request<T: Decodable>(_ target: Target, type: T.Type) async throws -> T {
            return try await withCheckedThrowingContinuation { continuation in
                provider.request(target) { result in
                    switch result {
                    case .success(let response):
                        if response.statusCode == HttpStatusCode.OK.rawValue {
                            guard let res = try? JSONDecoder.default.decode(T.self, from: response.data) else {
                                continuation.resume(throwing: MoyaError.jsonMapping(response))
                                return
                            }
                            continuation.resume(returning: res)
                        } else {
                            continuation.resume(throwing: HTTPResponseError(error: response))
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    var async: MoyaConcurrency {
        MoyaConcurrency(provider: self)
    }
}
