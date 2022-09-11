import Moya
import Foundation

public protocol TookAPI: TargetType, JwtAuthorizable {
    var domain: TookDomain { get }
    var urlPath: String { get }
}

public enum TookDomain: String {
    case auth
}
