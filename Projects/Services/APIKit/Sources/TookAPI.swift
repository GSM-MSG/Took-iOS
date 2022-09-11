import Moya
import Foundation

public protocol TookAPI: TargetType, JwtAuthorizable {
    var domain: TookDomain { get }
    var urlPath: String { get }
    var errorMapper: [Int: TookError] { get }
}

public extension TookAPI {
    var baseURL: URL {
        return URL(string: "")!
    }
    var path: String {
        domain.asURL + urlPath
    }
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

public enum TookDomain: String {
    case auth
    case businessCard = "business-cards"
    case user
    case image
    case email
}

extension TookDomain {
    var asURL: String {
        "/\(self.rawValue)"
    }
}
